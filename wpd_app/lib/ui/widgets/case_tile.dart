import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/models/case/case.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wpd_app/view_models/cart_viewmode.dart';

class CaseTile extends ConsumerWidget {
  const CaseTile({
    Key? key,
    required this.myCase,
    this.enabledSlidable = true,
  }) : super(key: key);

  final Case myCase;
  final bool enabledSlidable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Slidable(
        enabled: enabledSlidable,
        key: ValueKey(myCase.id),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              label: 'Add to Cart',
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icons.add_shopping_cart,
              onPressed: (context) {
                ref.read(CartViewModelProvider.provider).addCase(myCase);
              },
            ),
          ],
        ),
        child: Card(
          child: InkWell(
            onTap: () {
              Routemaster.of(context).push('/case/${myCase.id}');
            },
            customBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: ListTile(
                title: Text(
                  myCase.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 22),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    myCase.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
