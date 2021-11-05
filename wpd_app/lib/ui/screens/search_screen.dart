import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wpd_app/ui/widgets/case_tile.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/search_cases_screen_viewmodel.dart';

class SearchCasesScreen extends ConsumerStatefulWidget {
  const SearchCasesScreen({Key? key}) : super(key: key);

  @override
  _SearchCasesScreenState createState() => _SearchCasesScreenState();
}

class _SearchCasesScreenState extends ConsumerState<SearchCasesScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.read(SearchScreenViewModelProvider.provider).myCases = [];
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void search() {
    ref
        .read(SearchScreenViewModelProvider.provider)
        .searchCases(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
    }, child: Consumer(
      builder: (context, ref, child) {
        final searchViewModel =
            ref.watch(SearchScreenViewModelProvider.provider);

        return Scaffold(
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
                  search();
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
                  search();
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
        );
      },
    ));
  }
}
