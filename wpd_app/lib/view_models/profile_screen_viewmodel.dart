import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/services/qr/qr_service.dart';
import 'package:wpd_app/services/service_locator.dart';

abstract class ProfileScreenViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => ProfileScreenViewModel(),
  );
}

class ProfileScreenViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<QrService>();

  Widget getQR(String id) {
    return _requestRest.generateQR(
      value: 'https://wpd-backend.herokuapp.com/api/v1/users/$id',
    );
  }
}
