import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';

class FloatingButtons extends ConsumerWidget {
  const FloatingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthStateViewModelProvider.provider);

    return SpeedDial(
      icon: Icons.list,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add_shopping_cart_sharp),
          label: 'Add Case',
          onTap: () {/* Do someting */},
        ),
        SpeedDialChild(
          child: const Icon(Icons.star_border),
          label: 'Favorite Case',
          onTap: () {/* Do someting */},
        ),
        if (authViewModel.myUser?.role == Roles.admin ||
            authViewModel.myUser?.role == Roles.regular)
          SpeedDialChild(
            child: const Icon(Icons.edit),
            label: 'Edit Case',
            onTap: () {/* Do someting */},
          ),
        SpeedDialChild(
          child: Consumer(
            builder: (context, ref, child) {
              final cartViewModel = ref.watch(CartViewModelProvider.provider);
              return Badge(
                showBadge: !cartViewModel.isMyCartEmpty(),
                badgeContent: Text(
                  cartViewModel.myCart.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_cart_outlined),
              );
            },
          ),
          label: 'My Cart',
          onTap: () {/* Do someting */},
        ),
      ],
    );
  }
}
