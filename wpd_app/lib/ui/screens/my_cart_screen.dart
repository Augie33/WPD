import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/ui/screens/qr_screen.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';
import 'package:wpd_app/view_models/signal_case_screen_viewmodel.dart';

class MyCartScreen extends HookConsumerWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartViewModel = ref.watch(CartViewModelProvider.provider);
    final singleCaseViewModel =
        ref.watch(SingalCaseScreenViewModelProvider.provider);
    final authViewModel = ref.watch(AuthStateViewModelProvider.provider);

    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: cartViewModel.myCart.length,
        itemBuilder: (BuildContext context, int index) {
          final oneCase = cartViewModel.myCart[index];

          return Dismissible(
            key: ValueKey(oneCase.id),
            onDismissed: (_) {
              cartViewModel.removeCase(index);
              BotToast.showText(text: 'Removed ${oneCase.title}');
            },
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(15),
              child: const Icon(Icons.delete),
            ),
            child: CaseTile(
              myCase: oneCase,
              enabledSlidable: false,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 3),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.list,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.share),
            label: 'Share',
            onTap: () async {
              if (singleCaseViewModel.inclueCaseNumber) {
                final success =
                    await cartViewModel.showCaseNumberDialog(context) ?? false;

                if (!success) {
                  return;
                }

                final cart = await cartViewModel.createCart(
                  userId: authViewModel.myUser!.id,
                );
                HapticFeedback.lightImpact();
                await singleCaseViewModel.shareCase(
                  userId: authViewModel.myUser!.id,
                  cartId: cart?.id,
                );
              }
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code_2),
            label: 'QR Code',
            onTap: () async {
              if (singleCaseViewModel.inclueCaseNumber) {
                final success =
                    await cartViewModel.showCaseNumberDialog(context) ?? false;

                if (!success) {
                  return;
                }

                final cart = await cartViewModel.createCart(
                  userId: authViewModel.myUser!.id,
                );
                HapticFeedback.lightImpact();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => QRScreen(
                      cartId: cart?.id,
                    ),
                  ),
                );
              }
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.refresh),
            label: 'Reset My Cart',
            onTap: () {
              cartViewModel.resetMyCart();
              Navigator.pop(context);
            },
          ),
          SpeedDialChild(
            foregroundColor: singleCaseViewModel.inclueInfo
                ? Colors.green
                : isDarkMode
                    ? Colors.white
                    : Colors.black,
            child: const Icon(
              Icons.account_circle,
            ),
            label: 'Include your info',
            onTap: () {
              final value = !singleCaseViewModel.inclueInfo;

              singleCaseViewModel.toggleInclueInfo(value);
            },
          ),
        ],
      ),
    );
  }
}
