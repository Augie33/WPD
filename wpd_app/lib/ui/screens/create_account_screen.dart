import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:validators/validators.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/ui/widgets/custom_input_text_field.dart';
import 'package:wpd_app/view_models/create_account_screen_viewmodel.dart';

class CreateAccountScreen extends HookConsumerWidget {
  CreateAccountScreen({Key? key, this.user}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final User? user;

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please, type your email';
    } else if (!isEmail(value)) {
      return 'Please, type valid email';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.length < 6) {
      return 'At least 8 chars!';
    } else {
      return null;
    }
  }

  String? _validateOtherFields(String label, String? value) {
    if (value!.isEmpty || value.trim().isEmpty) {
      return 'Please, type $label';
    } else {
      return null;
    }
  }

  Future<void> _create(
    BuildContext context,
    CreateAccountScreenViewModel viewModel, {
    required User newUser,
    required password,
  }) async {
    if (_key.currentState?.validate() ?? false) {
      final success =
          await viewModel.createUser(newUser: newUser, password: password);

      if (success) {
        Routemaster.of(context).pop();
      }
    } else {
      debugPrint('Error :(');
    }
  }

  Future<void> _update(
    BuildContext context,
    CreateAccountScreenViewModel viewModel, {
    required User oldUser,
  }) async {
    if (_key.currentState?.validate() ?? false) {
      await viewModel.updateUser(oldUser: oldUser);
      Navigator.pop(context);
      Routemaster.of(context).push('/more/accounts');
    } else {
      debugPrint('Error :(');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createAccountScreenViewModel =
        ref.watch(CreateAccountScreenViewModelProvider.provider);

    final emailController = useTextEditingController(
      text: user?.email,
    );
    final passwordController = useTextEditingController();
    final firstNameController = useTextEditingController(
      text: user?.firstName,
    );
    final lastNameController = useTextEditingController(
      text: user?.lastName,
    );
    final rankController = useTextEditingController(
      text: user?.rank,
    );
    final departmentController = useTextEditingController(
      text: user?.department,
    );
    final phoneNumberController = useTextEditingController(
      text: user?.phoneNumber,
    );
    final stationPhoneNumberController = useTextEditingController(
      text: user?.stationPhoneNumber,
    );

    // initState
    useEffect(() {
      if (user != null) {
        createAccountScreenViewModel.setNewRole(user!.role, refresh: false);
      }

      // dispose
      return () {};
    }, []);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new account'),
          actions: [
            IconButton(
              icon: Icon(
                user == null ? Icons.person_add : Icons.edit,
                size: 30,
              ),
              onPressed: () async {
                if (user != null) {
                  await _update(
                    context,
                    createAccountScreenViewModel,
                    oldUser: User(
                      id: user!.id,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      rank: rankController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      department: departmentController.text,
                      stationPhoneNumber: stationPhoneNumberController.text,
                      role: user!.role,
                    ),
                  );
                } else {
                  await _create(
                    context,
                    createAccountScreenViewModel,
                    newUser: User(
                      id: '0',
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      rank: rankController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      department: departmentController.text,
                      stationPhoneNumber: stationPhoneNumberController.text,
                      role: Roles.regular,
                    ),
                    password: passwordController.text,
                  );
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                const SizedBox(height: 15),
                const RoleOptions(),
                CustomInputTextField(
                  controller: emailController,
                  validator: _validateEmail,
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                if (user == null)
                  CustomInputTextField(
                    controller: passwordController,
                    validator: _validatePassword,
                    hintText: 'Password',
                    icon: Icons.vpn_key,
                    obscureText: true,
                  ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: CustomInputTextField(
                        controller: firstNameController,
                        validator: (value) {
                          return _validateOtherFields('first name', value);
                        },
                        hintText: 'First name',
                        icon: Icons.badge,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: CustomInputTextField(
                        controller: lastNameController,
                        validator: (value) {
                          return _validateOtherFields('last name', value);
                        },
                        hintText: 'Last name',
                        icon: Icons.badge_outlined,
                      ),
                    ),
                  ],
                ),
                CustomInputTextField(
                  controller: rankController,
                  validator: (value) {
                    return _validateOtherFields('rank', value);
                  },
                  hintText: 'Rank',
                  icon: Icons.military_tech,
                ),
                CustomInputTextField(
                  controller: departmentController,
                  validator: (value) {
                    return _validateOtherFields('department', value);
                  },
                  hintText: 'Department',
                  icon: Icons.apartment,
                ),
                CustomInputTextField(
                  controller: phoneNumberController,
                  validator: (value) {
                    return _validateOtherFields('phone number', value);
                  },
                  hintText: 'Phone number',
                  icon: Icons.phone_iphone,
                ),
                CustomInputTextField(
                  controller: stationPhoneNumberController,
                  validator: (value) {
                    return _validateOtherFields('station number', value);
                  },
                  hintText: 'Station phone',
                  icon: Icons.phone,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleOptions extends ConsumerWidget {
  const RoleOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createAccountViewModel =
        ref.watch(CreateAccountScreenViewModelProvider.provider);

    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        ChoiceChip(
          label: const Text('Regular'),
          labelStyle: Theme.of(context).textTheme.headline3,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.7),
          selected: createAccountViewModel.newRole == Roles.regular,
          onSelected: (_) {
            createAccountViewModel.setNewRole(Roles.regular);
          },
        ),
        ChoiceChip(
          label: const Text('Viewer'),
          labelStyle: Theme.of(context).textTheme.headline3,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.7),
          selected: createAccountViewModel.newRole == Roles.viewer,
          onSelected: (_) {
            createAccountViewModel.setNewRole(Roles.viewer);
          },
        ),
        ChoiceChip(
          label: const Text('Admin'),
          labelStyle: Theme.of(context).textTheme.headline3,
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.7),
          selected: createAccountViewModel.newRole == Roles.admin,
          onSelected: (_) {
            createAccountViewModel.setNewRole(Roles.admin);
          },
        ),
      ],
    );
  }
}
