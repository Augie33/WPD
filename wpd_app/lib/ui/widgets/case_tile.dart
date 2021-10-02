import 'package:flutter/material.dart';
import 'package:wpd_app/models/case/case.dart';

class CaseTile extends StatelessWidget {
  const CaseTile({
    Key? key,
    required this.myCase,
  }) : super(key: key);

  final Case myCase;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: ListTile(
              title: Text(
                myCase.title,
                style: Theme.of(context).textTheme.headline1,
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
    );
  }
}
