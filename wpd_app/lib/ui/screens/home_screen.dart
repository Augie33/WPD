import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/case_list_parser.dart';
import 'package:wpd_app/api/json_parsers/case_parser.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/home_screen_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            // color: Theme.of(context).primaryColor,
            iconSize: 32,
            onPressed: () {
              Routemaster.of(context).push('add');
            },
          )
        ],
      ),
      body: FutureBuilder<List<Case>>(
        future: watch(HomeScreenViewModelProvider.provider).getCases(),
        builder: (BuildContext context, AsyncSnapshot<List<Case>> snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AbsorbPointer(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ShimmerLoader();
                },
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error :(',
                style: Theme.of(context).textTheme.headline1,
              ),
            );
          }

          if (data == null || data.isEmpty) {
            return Center(
              child: Text(
                'Please, add more cases',
                style: Theme.of(context).textTheme.headline1,
              ),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final myCase = data[index];

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
    );
  }
}
