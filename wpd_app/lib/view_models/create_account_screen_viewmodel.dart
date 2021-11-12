import 'dart:ffi';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/user_parser.dart';
import 'package:wpd_app/api/json_parsers/void_parser.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class CreateAccountScreenViewModelProvider {
  static final provider = ChangeNotifierProvider.autoDispose(
    (ref) => CreateAccountScreenViewModel(),
  );
}

class CreateAccountScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  bool _loading = false;
  bool get isLoading => _loading;
  String _newRole = Roles.regular;

  String get newRole => _newRole;

  void setNewRole(String role, {bool refresh = true}) {
    _newRole = role;
    if (refresh) {
      notifyListeners();
    }
  }

  Future<bool> createUser({
    required User newUser,
    required String password,
  }) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      await _requestRest.executePost<User>(
        '/users',
        const UserParser(),
        data: {
          'email': newUser.email,
          'password': password,
          'firstName': newUser.firstName,
          'lastName': newUser.lastName,
          'rank': newUser.rank,
          'department': newUser.department,
          'phoneNumber': newUser.phoneNumber,
          'stationPhoneNumber': newUser.stationPhoneNumber,
          'role': _newRole,
        },
      );
      HapticFeedback.lightImpact();
      BotToast.showText(
        text: 'Created ${newUser.firstName} ${newUser.lastName}',
      );

      _loading = false;
      BotToast.closeAllLoading();
      return true;
    } on DioError catch (e) {
      BotToast.showText(text: e.message);

      _loading = false;
      notifyListeners();
      BotToast.closeAllLoading();
      return false;
    } catch (e) {
      BotToast.showText(text: 'Error');
      _loading = false;
      notifyListeners();
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<bool> updateUser({
    required User oldUser,
  }) async {
    try {
      _loading = true;
      BotToast.showCustomLoading(
        toastBuilder: (_) => const AppLoader(),
      );

      await _requestRest.executePut<void>(
        '/users/${oldUser.id}',
        const VoidParser(),
        data: {
          'email': oldUser.email,
          'firstName': oldUser.firstName,
          'lastName': oldUser.lastName,
          'rank': oldUser.rank,
          'department': oldUser.department,
          'phoneNumber': oldUser.phoneNumber,
          'stationPhoneNumber': oldUser.stationPhoneNumber,
          'role': _newRole,
        },
      );
      HapticFeedback.lightImpact();
      BotToast.showText(
        text: 'Updated ${oldUser.firstName} ${oldUser.lastName}',
      );

      _loading = false;
      BotToast.closeAllLoading();
      return true;
    } on DioError catch (e) {
      BotToast.showText(text: e.message);

      _loading = false;
      notifyListeners();
      BotToast.closeAllLoading();
      return false;
    } catch (e) {
      BotToast.showText(text: 'Error');
      _loading = false;
      notifyListeners();
      BotToast.closeAllLoading();
      return false;
    }
  }
}
