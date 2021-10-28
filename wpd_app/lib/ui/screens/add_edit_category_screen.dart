import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';
import 'package:wpd_app/ui/widgets/category_tile.dart';
import 'package:wpd_app/ui/widgets/custom_form_field.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/add_edit_category_viewmodel.dart';

class AddEditCategoryScreen extends HookWidget {
  const AddEditCategoryScreen({Key? key}) : super(key: key);

  void showAddEditTextField(BuildContext context,
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
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Add'),
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
                showAddEditTextField(context, titleController: titleController);
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
                      showAddEditTextField(context,
                          titleController: titleController, category: category);
                    },
                  );
                }),
      ),
    );
  }
}
