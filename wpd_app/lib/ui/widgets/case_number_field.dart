import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/ui/widgets/custom_form_field.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';

class CaseNumberField extends HookConsumerWidget {
  const CaseNumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseNumberTextController = useTextEditingController();
    final cartViewModle = ref.watch(CartViewModelProvider.provider);

    // initState
    useEffect(() {
      caseNumberTextController.clear();

      // dispose
      return () {};
    }, []);

    return SimpleDialog(
      children: [
        CustomFormField(
          controller: caseNumberTextController,
          hintText: '',
          autofocus: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () async {
                if (caseNumberTextController.text.trim().isNotEmpty) {
                  cartViewModle.caseNumber = caseNumberTextController.text;
                  Navigator.pop(context, true);
                }
              },
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('Share'),
            ),
          ],
        ),
      ],
      title: const Text('Type Case number?'),
    );
  }
}
