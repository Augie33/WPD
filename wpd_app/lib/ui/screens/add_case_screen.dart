import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/models/case/case.dart';

class AddCaseScreen extends HookWidget {
  AddCaseScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();

  String? _validateTitle(String? value) {
    if (value!.isEmpty) {
      return 'Please, write case title';
    } else if (value.trim().isEmpty) {
      return 'Please, write case title';
    } else {
      return null;
    }
  }

  String? _validateDescription(String? value) {
    if (value!.isEmpty) {
      return 'Please, write case description';
    } else if (value.trim().isEmpty) {
      return 'Please, write case description';
    } else {
      return null;
    }
  }

  String? _validateUrl(String? value) {
    if (value!.isEmpty) {
      return 'Please, write case URL';
    } else if (value.trim().isEmpty) {
      return 'Please, write case URL';
    } else {
      return null;
    }
  }

  Future<void> _submit(BuildContext context, Case newCase) async {
    if (_key.currentState?.validate() ?? false) {
    } else {
      debugPrint('Error :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final urlController = useTextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _key,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Case'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.add_box_outlined,
                  size: 30,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: Center(
            child: Column(
              children: [
                AddTextField(
                  controller: titleController,
                  validator: _validateTitle,
                  hintText: 'Title',
                  icon: Icons.title,
                ),
                AddTextField(
                  controller: descriptionController,
                  validator: _validateDescription,
                  hintText: 'Description',
                  icon: Icons.description,
                  maxLines: 5,
                ),
                AddTextField(
                  controller: urlController,
                  validator: _validateUrl,
                  hintText: 'URL',
                  icon: Icons.link,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Upload PDF'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () async {
              _submit(
                context,
                const Case(
                  id: 'asd',
                  title: 'asd',
                  description: 'asda',
                  url: 'asdas',
                  urlPDF: 'asda',
                  caseNumber: 2312,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AddTextField extends StatelessWidget {
  const AddTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.icon,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData icon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
