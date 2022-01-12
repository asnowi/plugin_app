import 'package:get/get.dart';

class GlobalService extends GetxService {
  /// 发布渠道
  var channel = "".obs;

  Future<GlobalService> init() async {
    channel.value = "official";
    return this;
  }
}