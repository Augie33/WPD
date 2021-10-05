import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'package:wpd_app/ui/widgets/case_tile.dart';
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

    context.read(HomeScreenViewModelProvider.provider).getCases();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () => context
          .read(HomeScreenViewModelProvider.provider)
          .getCases(refresh: true),
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
