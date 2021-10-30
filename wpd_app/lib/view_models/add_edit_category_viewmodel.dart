import 'package:bot_toast/bot_toast.dart';
import 'package:dio_http/dio_http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wpd_app/api/http_client.dart';
import 'package:wpd_app/api/json_parsers/category_list_parser.dart';
import 'package:wpd_app/api/json_parsers/category_parser.dart';
import 'package:wpd_app/models/custom_category/custom_category.dart';
import 'package:wpd_app/services/service_locator.dart';
import 'package:wpd_app/ui/widgets/loader.dart';

abstract class AddEditCategoryViewModelProvider {
  static final provider = ChangeNotifierProvider(
    (ref) => AddEditCategoryViewModel(),
  );
}

class AddEditCategoryViewModel extends ChangeNotifier {
  final _requestRest = serviceLocator<RequestREST>();

  List<CustomCategory> categories = [];

  bool _loading = false;
  bool get isLoading => _loading;

  Future<void> getCategories({bool refresh = false}) async {
    try {
      _loading = true;

      if (refresh == true) {
        notifyListeners();
      }

      var data = await _requestRest.executeGet<List<CustomCategory>>(
        '/category?sort=title&limit=1000',
        const CategoryListParser(),
      );

      categories = data;

      _loading = false;
      notifyListeners();
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

  Future<void> createEditCategory(CustomCategory category,
      {bool isEdit = false}) async {
    BotToast.showCustomLoading(
      toastBuilder: (_) => const AppLoader(),
    );

    if (isEdit) {
      await _requestRest.executePut<CustomCategory>(
        '/category/${category.id}',
        const CategoryParser(),
        data: {'title': category.title},
      );

      BotToast.showText(text: 'Edited the ${category.title}');
      BotToast.closeAllLoading();

      return;
    }

    await _requestRest.executePost<CustomCategory>(
      '/category',
      const CategoryParser(),
      data: {'title': category.title},
    );

    BotToast.showText(text: 'Added the ${category.title}');
    BotToast.closeAllLoading();
  }
}
