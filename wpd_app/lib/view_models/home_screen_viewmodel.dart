import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/models/case/case.dart';

abstract class HomeScreenViewModelProvider {
  static final provider =
      ChangeNotifierProvider((ref) => HomeScreenViewModel());
}

class HomeScreenViewModel extends ChangeNotifier {
  List<Case> myCases = [];

  bool _loading = false;
  bool get isLoading => _loading;

  Future<List<Case>> getCases() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    return [
      const Case(
        id: '123123',
        title: 'Test1',
        description:
            'SDASDasdasdadasdlaskdlasdasdasdasdasdasdasdasdaskdl;askdl;akdlaskdl;askd;laskdl;askdl;askdl;aksl;dkasl;dkAS',
        url: 'mongodb.com',
        urlPDF: 'google.com',
        caseNumber: 1,
      ),
      const Case(
        id: '123123',
        title: 'Test2',
        description:
            'SDASDasdasdadasdlaskdlasdasdasdasdasdasdasdasdaskdl;askdl;akdlaskdl;askd;laskdl;askdl;askdl;aksl;dkasl;dkAS',
        url: 'mongodb.com',
        urlPDF: 'google.com',
        caseNumber: 1,
      ),
      const Case(
        id: '123123',
        title: 'Test3',
        description:
            'SDASDasdasdadasdlaskdlasdasdasdasdasdasdasdasdaskdl;askdl;akdlaskdl;askd;laskdl;askdl;askdl;aksl;dkasl;dkAS',
        url: 'mongodb.com',
        urlPDF: 'google.com',
        caseNumber: 1,
      ),
    ];
  }
}
