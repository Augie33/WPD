import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';
import 'package:wpd_app/ui/widgets/category_tile.dart';
import 'package:wpd_app/ui/widgets/custom_form_field.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/add_edit_category_viewmodel.dart';

class AddEditCategoryScreen extends HookWidget {
  const AddEditCategoryScreen({Key? key}) : super(key: key);

  void showAddEditTextField(
      BuildContext context, AddEditCategoryViewModel categoryViewModel,
      {required TextEditingController titleController,
      CustomCategory? category}) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              CustomFormField(
                controller: titleController,
                hintText: '',
                autofocus: true,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    if (category != null) {
                      final newCategory = CustomCategory(
                          id: category.id, title: titleController.text);

                      await categoryViewModel.createEditCategory(newCategory,
                          isEdit: true);

                      titleController.clear();

                      Navigator.of(context).pop();

                      categoryViewModel.getCategories(refresh: true);

                      return;
                    }

                    final newCategory =
                        CustomCategory(id: '0', title: titleController.text);

                    Navigator.of(context).pop();

                    titleController.clear();

                    await categoryViewModel.createEditCategory(newCategory);

                    categoryViewModel.getCategories(refresh: true);
                  },
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child:
                      category != null ? const Text('Edit') : const Text('Add'),
                ),
              )
            ],
            title: const Text('Add Category'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final categoryViewModel =
        useProvider(AddEditCategoryViewModelProvider.provider);

    // initState
    useEffect(() {
      categoryViewModel.getCategories();
    }, []);

    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () => categoryViewModel.getCategories(refresh: true),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add / Edit category'),
          actions: [
            IconButton(
              iconSize: 32,
              icon: const Icon(Icons.playlist_add),
              onPressed: () {
                titleController.clear();
                showAddEditTextField(context, categoryViewModel,
                    titleController: titleController);
              },
            ),
          ],
        ),
        body: categoryViewModel.isLoading
            ? const Center(
                child: AppLoader(),
              )
            : ListView.builder(
                itemCount: categoryViewModel.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categoryViewModel.categories[index];

                  return CategoryTile(
                    category: category,
                    onPressed: () {
                      titleController.text = category.title;

                      showAddEditTextField(context, categoryViewModel,
                          titleController: titleController, category: category);
                    },
                  );
                }),
      ),
    );
  }
}
