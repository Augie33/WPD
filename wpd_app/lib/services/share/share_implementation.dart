import 'package:share_plus/share_plus.dart';
import 'package:wpd_app/services/share/share_service.dart';

class ShareImpl implements ShareService {
  @override
  Future<void> shareURL({required String url}) async {
    await Share.share(url);
  }
}
