import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/search_cases_screen_viewmodel.dart';

class SearchCasesScreen extends HookWidget {
  const SearchCasesScreen({Key? key}) : super(key: key);

  void search(SearchCaseViewModel provider, TextEditingController text) {
    provider.searchCases(text.text);
  }

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final searchViewModel = useProvider(SearchScreenViewModelProvider.provider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {
                search(
                  searchViewModel,
                  searchController,
                );
              },
              autofocus: true,
              cursorColor: Theme.of(context).primaryColor,
              maxLines: 1,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                hintText: 'search..',
                hintStyle: TextStyle(fontSize: 18),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              // validator: validator,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                search(
                  searchViewModel,
                  searchController,
                );
              },
              icon: const Icon(
                Icons.search,
                size: 34,
              ),
            )
          ],
        ),
        body: searchViewModel.isLoading
            ? AbsorbPointer(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ShimmerLoader();
                  },
                ),
              )
            : searchViewModel.myCases.isEmpty
                ? Center(
                    child: Text(
                      'Empty...',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                : ListView.builder(
                    itemCount: searchViewModel.myCases.length,
                    itemBuilder: (context, index) {
                      final myCase = searchViewModel.myCases[index];

                      return CaseTile(myCase: myCase);
                    },
                  ),
      ),
    );
  }
}
