import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';

class MoreScreen extends HookWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStateViewModel = useProvider(AuthStateViewModelProvider.provider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: ListView(
        children: [
          if (authStateViewModel.myUser != null &&
              authStateViewModel.myUser!.role == 'admin')
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Admin',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey[500]),
                    ),
                  ),
                ),
                SettingTile(
                  label: 'Create a new account',
                  icon: Icons.person_add,
                  onTap: () {
                    Routemaster.of(context).push('create');
                  },
                ),
                SettingTile(
                  label: 'Show all accounts',
                  icon: Icons.people,
                  onTap: () {
                    Routemaster.of(context).push('accounts');
                  },
                ),
                SettingTile(
                  label: 'Add / Edit category',
                  icon: Icons.list,
                  onTap: () {
                    Routemaster.of(context).push('category');
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Settings',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey[500]),
            ),
          ),
          SettingTile(
            label: 'Help',
            icon: Icons.help,
            onTap: () {},
          ),
          const SettingTileWithSubtitle(
            label: 'About APP',
            subtitle: '1.0',
            icon: Icons.info,
          ),
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            label,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}

class SettingTileWithSubtitle extends StatelessWidget {
  const SettingTileWithSubtitle({
    Key? key,
    required this.icon,
    required this.label,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            label,
            style: Theme.of(context).textTheme.headline3,
          ),
          trailing: Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
