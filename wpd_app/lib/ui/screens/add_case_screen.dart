import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/ui/widgets/custom_input_text_field.dart';
import 'package:wpd_app/view_models/add_case_screen_viewmodel.dart';
import 'package:wpd_app/view_models/home_screen_viewmodel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddCaseScreen extends HookConsumerWidget {
  AddCaseScreen({
    this.caseId,
    this.myCase,
    Key? key,
  }) : super(key: key);

  final String? caseId;
  final Case? myCase;
  final _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? _validateTitle(String? value) {
    if (value!.isEmpty) {
      return 'Please, type case title';
    } else if (value.trim().isEmpty) {
      return 'Please, type case title';
    } else {
      return null;
    }
  }

  String? _validateDescription(String? value) {
    if (value!.isEmpty) {
      return 'Please, type case description';
    } else if (value.trim().isEmpty) {
      return 'Please, type case description';
    } else {
      return null;
    }
  }

  // String? _validateUrl(String? value) {
  //   if (value!.isEmpty) {
  //     return 'Please, type case URL';
  //   } else if (value.trim().isEmpty) {
  //     return 'Please, type case URL';
  //   } else if (!isURL(value)) {
  //     return 'Please, type valid URL';
  //   } else {
  //     return null;
  //   }
  // }

  Future<void> _submit(BuildContext context,
      AddCaseScreenViewModel caseScreenViewModel, Case newCase) async {
    if (_key.currentState?.validate() ?? false) {
      final myCase = await caseScreenViewModel.submitCase(newCase);

      Routemaster.of(context).pop();

      if (myCase != null) {
        Routemaster.of(context).push('/case/${myCase.id}');
      }
    } else {
      debugPrint('Error :(');
    }
  }

  Future<void> _submitEdit(BuildContext context,
      AddCaseScreenViewModel caseScreenViewModel, Case oldCase) async {
    if (_key.currentState?.validate() ?? false) {
      await caseScreenViewModel.editCase(oldCase);

      Routemaster.of(context).pop();

      Navigator.pop(context);
    } else {
      debugPrint('Error :(');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addCaseViewmodel = ref.watch(AddCaseScreenViewModelProvider.provider);
    final titleController = useTextEditingController(
      text: myCase?.title,
    );
    final descriptionController = useTextEditingController(
      text: myCase?.description,
    );
    final urlController = useTextEditingController(
      text: myCase?.url,
    );
    final urlPdfController = useTextEditingController(
      text: myCase?.urlPDF,
    );
    final FocusNode _focusNode = FocusNode();

    // initState
    useEffect(() {
      addCaseViewmodel.file = null;
      addCaseViewmodel.selectedCategory(null, notifyListener: false);

      if (myCase != null) {
        addCaseViewmodel.selectedCategory(
          myCase!.category,
          notifyListener: false,
        );

        addCaseViewmodel.setUploadFromDevice(false, refresh: false);
      }

      // dispose
      return () {
        _focusNode.dispose();
      };
    }, []);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _key,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('Add Case Template'),
            actions: [
              IconButton(
                icon: Icon(
                  myCase == null ? Icons.add_box_outlined : Icons.edit,
                  size: 30,
                ),
                onPressed: () async {
                  if (addCaseViewmodel.selectedCateogry == null) {
                    BotToast.showText(text: 'Please, choose a category');
                    return;
                  }

                  if (myCase != null) {
                    await _submitEdit(
                      context,
                      addCaseViewmodel,
                      Case(
                        id: myCase!.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        url: urlController.text,
                        urlPDF: urlPdfController.text,
                        caseNumber: 0,
                        category: addCaseViewmodel.selectedCateogry!,
                      ),
                    );
                  } else {
                    await _submit(
                      context,
                      addCaseViewmodel,
                      Case(
                        id: 'n/a',
                        title: titleController.text,
                        description: descriptionController.text,
                        url: urlController.text,
                        urlPDF: urlPdfController.text,
                        caseNumber: 0,
                        category: addCaseViewmodel.selectedCateogry!,
                      ),
                    );
                  }
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  CustomInputTextField(
                    controller: titleController,
                    validator: _validateTitle,
                    hintText: 'Title',
                    icon: Icons.title,
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      showBarModalBottomSheet(
                        context: context,
                        builder: (context) => const CategoryOptions(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            addCaseViewmodel.selectedCateogry?.title ??
                                'Please, choose category',
                            style: addCaseViewmodel.selectedCateogry != null
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold)
                                : Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  CustomInputTextField(
                    controller: descriptionController,
                    validator: _validateDescription,
                    hintText: 'Description',
                    icon: Icons.description,
                    maxLines: 5,
                  ),
                  CustomInputTextField(
                    controller: urlController,
                    validator: null,
                    hintText: 'URL',
                    icon: Icons.link,
                  ),
                  if (!addCaseViewmodel.uploadFromDevice)
                    CustomInputTextField(
                      controller: urlPdfController,
                      validator: null,
                      hintText: 'PDF URL',
                      icon: Icons.picture_as_pdf,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                      title: Text(
                        'Upload from device',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey[400]),
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      value: addCaseViewmodel.uploadFromDevice,
                      onChanged: (value) {
                        addCaseViewmodel.setUploadFromDevice(value);
                      },
                    ),
                  ),
                  if (addCaseViewmodel.uploadFromDevice)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.picture_as_pdf),
                            label: const Text('Upload PDF'),
                            onPressed: () async {
                              await addCaseViewmodel.pickPDF();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(addCaseViewmodel.getFilePath() ?? ''),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryOptions extends HookConsumerWidget {
  const CategoryOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(HomeScreenViewModelProvider.provider);
    final addCaseScreenViewModel =
        ref.watch(AddCaseScreenViewModelProvider.provider);
    final categories = homeViewModel.categories;
    final selectedCategory = addCaseScreenViewModel.selectedCateogry;

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];

        return ListTile(
          onTap: () {
            addCaseScreenViewModel.selectedCategory(category);
            Navigator.pop(context);
          },
          title: Text(
            category.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          trailing: selectedCategory == category
              ? Icon(
                  Icons.radio_button_checked,
                  color: Theme.of(context).primaryColor,
                )
              : const Icon(Icons.radio_button_unchecked),
        );
      },
    );
  }
}
