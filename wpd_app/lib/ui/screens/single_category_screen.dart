import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/home_screen_viewmodel.dart';

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
