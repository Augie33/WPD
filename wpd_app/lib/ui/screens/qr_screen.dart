import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/signal_case_screen_viewmodel.dart';

class QRScreen extends ConsumerWidget {
  const QRScreen({Key? key, this.cartId}) : super(key: key);

  final String? cartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singalCaseViewModel =
        ref.watch(SingalCaseScreenViewModelProvider.provider);

    final authViewModel = ref.watch(AuthStateViewModelProvider.provider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
      ),
      body: Center(
        child: Card(
          child: singalCaseViewModel.showQR(
            userId: authViewModel.myUser!.id,
            cartId: cartId,
          ),
        ),
      ),
    );
  }
}
