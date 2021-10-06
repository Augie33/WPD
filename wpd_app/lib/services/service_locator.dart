import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/services/pdf/pdf_implementation.dart';
import 'package:wpd_app/services/pdf/pdf_service.dart';
import 'package:wpd_app/services/qr/qr_service.dart';
import 'package:wpd_app/services/qr/qr_implementation.dart';
import 'package:wpd_app/services/secure_storage/secure_storage_implementation.dart';
import 'package:wpd_app/services/secure_storage/secure_storage_service.dart';
import 'package:wpd_app/services/share/share_implementation.dart';
import 'package:wpd_app/services/share/share_service.dart';
import 'package:wpd_app/services/storage/storage_service.dart';
import 'package:wpd_app/services/storage/storage_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator({required SharedPreferences sharedPreferences}) {
  // Services

  serviceLocator.registerLazySingleton<PDFService>(
    () => PDFImpl(),
  );

  serviceLocator.registerLazySingleton<QRService>(
    () => QRImpl2(),
  );

  serviceLocator.registerLazySingleton<ShareService>(
    () => ShareImpl(),
  );

  serviceLocator.registerLazySingleton<StorageService>(
    () => StorageServiceImpl(sharedPreferences: sharedPreferences),
  );

  serviceLocator.registerLazySingleton<ScureStorageService>(
    () => SecureStorageImpl(),
  );

  serviceLocator.registerLazySingleton<RequestREST>(
    () => const RequestREST(),
  );
}
