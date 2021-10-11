import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/show_accounts_screen_viewmodel.dart';

class ShowAccountScreen extends StatefulWidget {
  const ShowAccountScreen({Key? key}) : super(key: key);

  @override
  State<ShowAccountScreen> createState() => _ShowAccountScreenState();
}

class _ShowAccountScreenState extends State<ShowAccountScreen> {
  @override
  void initState() {
    super.initState();

    context.read(ShowAccountsScreenViewModelProvider.provider).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show all accounts'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final showAccountsViewModel =
              watch(ShowAccountsScreenViewModelProvider.provider);

          return showAccountsViewModel.isLoading
              ? ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const ShimmerLoader();
                  },
                )
              : showAccountsViewModel.accounts.isEmpty
                  ? Center(
                      child: Text(
                        'Empty...',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  : ListView.builder(
                      itemCount: showAccountsViewModel.accounts.length,
                      itemBuilder: (context, index) {
                        final user = showAccountsViewModel.accounts[index];

                        return UserTile(user: user);
                      },
                    );
        },
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Card(
        child: InkWell(
          onTap: () {
            Routemaster.of(context).push('/more/accounts/${user.id}');
          },
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: ListTile(
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 22),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  user.email,
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
