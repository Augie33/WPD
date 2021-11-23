import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/view_models/help_screen_viewmodel.dart';

class HelpScreen extends ConsumerWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helpScreenViewModel = ref.watch(HelpScreenViewModelProvider.provider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: helpScreenViewModel.showPdf(),
    );
  }
}
