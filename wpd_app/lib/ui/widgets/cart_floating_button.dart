import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';

class CartFloatingButton extends ConsumerWidget {
  const CartFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartViewModel = ref.watch(CartViewModelProvider.provider);

    return cartViewModel.isMyCartEmpty()
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: FloatingActionButton(
              heroTag: 'cart',
              child: Badge(
                badgeContent: Text(
                  cartViewModel.myCart.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(
                  Icons.add_shopping_cart,
                  size: 30,
                ),
              ),
              onPressed: () {},
            ),
          );
  }
}
