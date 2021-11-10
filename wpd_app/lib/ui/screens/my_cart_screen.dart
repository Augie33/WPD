import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';

class MyCartScreen extends ConsumerWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartViewModel = ref.watch(CartViewModelProvider.provider);

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
            onTap: () {/* Do someting */},
          ),
          SpeedDialChild(
            child: const Icon(Icons.send),
            label: 'Email',
            onTap: () {/* Do someting */},
          ),
          SpeedDialChild(
            child: const Icon(Icons.qr_code_2),
            label: 'QR Code',
            onTap: () {/* Do someting */},
          ),
          SpeedDialChild(
            child: const Icon(Icons.refresh),
            label: 'Reset My Cart',
            onTap: () {
              cartViewModel.resetMyCart();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
