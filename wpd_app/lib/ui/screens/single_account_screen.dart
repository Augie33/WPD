import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/ui/screens/profile_screen.dart';
import 'package:wpd_app/ui/widgets/loader.dart';
import 'package:wpd_app/view_models/show_accounts_screen_viewmodel.dart';
import 'package:wpd_app/view_models/singal_account_viewmodel.dart';

class SingleAccountScreen extends StatefulWidget {
  const SingleAccountScreen({Key? key, required this.userId}) : super(key: key);

  final String? userId;

  @override
  _SingleAccountScreenState createState() => _SingleAccountScreenState();
}

class _SingleAccountScreenState extends State<SingleAccountScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read(SingalAccountScreenViewModelProvider.provider)
        .fetchUser(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final singalAccountViewModel =
            watch(SingalAccountScreenViewModelProvider.provider);
        final user = singalAccountViewModel.user;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: user?.role == 'admin'
                    ? null
                    : () async {
                        if (user?.role != 'admin') {
                          await context
                              .read(
                                  SingalAccountScreenViewModelProvider.provider)
                              .removeAccount(userId: widget.userId);
                          Routemaster.of(context).pop();
                          context
                              .read(
                                  ShowAccountsScreenViewModelProvider.provider)
                              .getUsers(refresh: true);
                        }
                      },
                color: Colors.redAccent,
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          body: singalAccountViewModel.isLoading
              ? const Center(
                  child: AppLoader(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/logo.png',
                                    height: 130,
                                    width: 130,
                                  ),
                                ),
                              ),
                              singalAccountViewModel.user == null
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            label: 'Full name',
                                            data:
                                                '${user?.firstName} ${user?.lastName}',
                                          ),
                                          CustomText(
                                            label: 'Rank',
                                            data: '${user?.rank}',
                                          ),
                                          CustomText(
                                            label: 'Email',
                                            data: '${user?.email}',
                                          ),
                                          CustomText(
                                            label: 'Phone number',
                                            data: '${user?.phoneNumber}',
                                          ),
                                          CustomText(
                                            label: 'Role',
                                            data: '${user?.role}',
                                          ),
                                          CustomText(
                                            label: 'Department',
                                            data: '${user?.department}',
                                          ),
                                          CustomText(
                                            label: 'Station Number',
                                            data: '${user?.phoneNumber}',
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        if (user != null)
                          Container(
                            padding: const EdgeInsets.only(top: 3),
                            child: singalAccountViewModel.showQR(),
                          )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
