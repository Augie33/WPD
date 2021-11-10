import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/ui/widgets/cart_floating_button.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/favorite_viewmodel.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteViewModel = ref.watch(FavoriteViewModelProvider.provider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: favoriteViewModel.isLoading
          ? ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return const ShimmerLoader();
              },
            )
          : favoriteViewModel.favorite.cases.isEmpty
              ? Center(
                  child: Text(
                    'Empty...',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : ListView.separated(
                  itemCount: favoriteViewModel.favorite.cases.length,
                  itemBuilder: (context, index) {
                    final myCase = favoriteViewModel.favorite.cases[index];

                    return CaseTile(myCase: myCase);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 3),
                ),
      floatingActionButton: const CartFloatingButton(),
    );
  }
}
