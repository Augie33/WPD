import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/ui/widgets/custom_border_form_field.dart';
import 'package:wpd_app/view_models/home_screen_viewmodel.dart';

class AddCaseScreen extends HookWidget {
  const AddCaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Case'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomBorderFormField(
              controller: titleController,
              hintText: 'Title',
              icon: Icons.dangerous,
              validator: (value) {},
            ),
            CustomBorderFormField(
              controller: titleController,
              hintText: 'Title',
              icon: Icons.dangerous,
              validator: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
