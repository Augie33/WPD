import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/view_models/auth_state_viewmodel.dart';
import 'package:wpd_app/view_models/profile_screen_viewmodel.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final appState = watch(AuthStateViewModelProvider.provider);
    final profileState = watch(ProfileScreenViewModelProvider.provider);
    final user = appState.myUser;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.redAccent,
              iconSize: 28,
              tooltip: 'Logout',
              onPressed: () async {
                await context
                    .read(AuthStateViewModelProvider.provider)
                    .logout();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
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
                      appState.myUser == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                    child: profileState
                        .getQR('https://andrewducnguyen.dev/users3'),
                  )
              ],
            ),
          ),
        ),
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
    final width = MediaQuery.of(context).size.width;
    print(width);

    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            '$label :   ',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: width < 500 ? 16 : 20),
          ),
          SelectableText(
            data,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.yellow[800],
                  fontSize: width < 400 ? 16 : 20,
                ),
          ),
        ],
      ),
    );
  }
}
