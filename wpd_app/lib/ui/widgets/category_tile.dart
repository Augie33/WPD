import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    this.onPressed,
  }) : super(key: key);

  final CustomCategory category;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Card(
        child: InkWell(
          onTap: onPressed != null
              ? () {
                  onPressed!();
                }
              : () {
                  Routemaster.of(context).push('/category/${category.id}');
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
