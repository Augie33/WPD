import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            iconSize: 28,
            onPressed: () {
              Routemaster.of(context).push('edit');
            },
          )
        ],
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final appState = watch(AuthStateViewModelProvider.provider);
          final user = appState.myUser;

          return Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            label: 'Full name',
                            data: '${user?.firstName} ${user?.lastName}',
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
                            label: 'Station Phone Number',
                            data: '${user?.phoneNumber}',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            '$label :   ',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            data,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.yellow[700]),
          ),
        ],
      ),
    );
  }
}
