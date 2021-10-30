import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/ui/widgets/category_tile.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/home_screen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read(HomeScreenViewModelProvider.provider).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () => context
          .read(HomeScreenViewModelProvider.provider)
          .getCategories(refresh: true),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              iconSize: 32,
              tooltip: 'Add Case',
              onPressed: () {
                Routemaster.of(context).push('add');
              },
            )
          ],
        ),
        body: Consumer(
          builder: (context, watch, child) {
            final homeViewModel = watch(HomeScreenViewModelProvider.provider);

            return homeViewModel.isLoading
                ? ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return const ShimmerLoader();
                    },
                  )
                : homeViewModel.categories.isEmpty
                    ? Center(
                        child: Text(
                          'Empty...',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      )
                    : ListView.builder(
                        itemCount: homeViewModel.categories.length,
                        itemBuilder: (context, index) {
                          final category = homeViewModel.categories[index];

                          return CategoryTile(category: category);
                        },
                      );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {
            Routemaster.of(context).push('search');
          },
        ),
      ),
    );
  }
}

class SingleCategoryScreen extends HookWidget {
  const SingleCategoryScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  final String? categoryId;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = useProvider(HomeScreenViewModelProvider.provider);

    // initState
    useEffect(() {
      homeViewModel.getCases(categoryId: categoryId!);
    }, []);

    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () => context
          .read(HomeScreenViewModelProvider.provider)
          .getCases(refresh: true, categoryId: categoryId!),
      child: Scaffold(
        appBar: AppBar(
          title: Text(homeViewModel.selectedCateogry!.title),
        ),
        body: homeViewModel.isLoading
            ? ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const ShimmerLoader();
                },
              )
            : homeViewModel.myCases.isEmpty
                ? Center(
                    child: Text(
                      'Empty...',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                : ListView.builder(
                    itemCount: homeViewModel.myCases.length,
                    itemBuilder: (context, index) {
                      final myCase = homeViewModel.myCases[index];

                      return CaseTile(myCase: myCase);
                    },
                  ),
      ),
    );
  }
}
