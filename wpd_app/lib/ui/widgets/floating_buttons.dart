import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/ui/screens/my_cart_screen.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';
import 'package:wpd_app/view_models/favorite_viewmodel.dart';
import 'package:wpd_app/view_models/signal_case_screen_viewmodel.dart';

class FloatingButtons extends ConsumerWidget {
  const FloatingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(AuthStateViewModelProvider.provider);
    final cartViewModel = ref.watch(CartViewModelProvider.provider);
    final favoriteViewModel = ref.watch(FavoriteViewModelProvider.provider);
    final myCase = ref.read(SingalCaseScreenViewModelProvider.provider).myCase;

    return SpeedDial(
      icon: Icons.list,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add_shopping_cart_sharp),
          label: 'Add Case',
          onTap: () {
            if (myCase != null) {
              cartViewModel.addCase(myCase);
            }
          },
        ),
        if (myCase != null)
          SpeedDialChild(
            child: Icon(
              favoriteViewModel.checkCase(myCase)
                  ? Icons.star
                  : Icons.star_border,
              color: favoriteViewModel.checkCase(myCase)
                  ? Theme.of(context).primaryColor
                  : null,
            ),
            label: favoriteViewModel.checkCase(myCase)
                ? 'Unfavorite Case'
                : 'Favorite Case',
            onTap: () async {
              if (favoriteViewModel.checkCase(myCase)) {
                await favoriteViewModel.unFavoriteCase(myCase.id);
              } else {
                await favoriteViewModel.favoriteCase(myCase.id);
              }
            },
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
          onTap: () {
            showBarModalBottomSheet(
              context: context,
              builder: (context) => const MyCartScreen(),
            );
          },
        ),
      ],
    );
  }
}
