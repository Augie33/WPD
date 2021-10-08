import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/user_parser.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class CreateAccountScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => CreateAccountScreenViewModel(),
  );
}

class CreateAccountScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  bool _loading = false;
  bool get isLoading => _loading;

  Future<void> createUser({
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
          'role': newUser.role,
        },
      );

      BotToast.showText(
        text: 'Created ${newUser.firstName} ${newUser.lastName}',
      );

      print('Doooneee');

      _loading = false;
      BotToast.closeAllLoading();
    } on DioError catch (e) {
      BotToast.showText(text: e.message);

      _loading = false;
      notifyListeners();
    } catch (e) {
      BotToast.showText(text: 'Error');
      _loading = false;
      notifyListeners();
    }
  }
}
