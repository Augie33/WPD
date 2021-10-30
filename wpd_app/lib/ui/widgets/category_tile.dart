import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';
import 'package:wpd_app/view_models/home_screen_viewmodel.dart';

class CategoryTile extends HookWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    this.onPressed,
  }) : super(key: key);

  final CustomCategory category;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = useProvider(HomeScreenViewModelProvider.provider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Card(
        child: InkWell(
          onTap: onPressed != null
              ? () {
                  onPressed!();
                }
              : () {
                  homeViewModel.selectedCateogry = category;
                  Routemaster.of(context).push('${category.id}/cases');
                },
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: ListTile(
              title: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 24),
              ),
              trailing: Icon(
                onPressed != null ? Icons.edit : Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
