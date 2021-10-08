import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:validators/validators.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/ui/widgets/custom_input_text_field.dart';
import 'package:wpd_app/view_models/create_account_screen_viewmodel.dart';

class CreateAccountScreen extends HookWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();

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

  Future<void> _create(BuildContext context,
      {required User newUser, required password}) async {
    if (_key.currentState?.validate() ?? false) {
      await context
          .read(CreateAccountScreenViewModelProvider.provider)
          .createUser(newUser: newUser, password: password);

      Routemaster.of(context).pop();
    } else {
      debugPrint('Error :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final rankController = useTextEditingController();
    final departmentController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final stationPhoneNumberController = useTextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new account'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.person_add,
                size: 30,
              ),
              onPressed: () async {
                await _create(
                  context,
                  newUser: User(
                    id: '0',
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    rank: rankController.text,
                    email: emailController.text,
                    phoneNumber: phoneNumberController.text,
                    department: departmentController.text,
                    stationPhoneNumber: stationPhoneNumberController.text,
                    role: 'police',
                  ),
                  password: passwordController.text,
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                CustomInputTextField(
                  controller: emailController,
                  validator: _validateEmail,
                  hintText: 'Email',
                  icon: Icons.email,
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
