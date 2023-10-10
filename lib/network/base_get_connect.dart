import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BaseGetConnect extends GetConnect {
  @override
  void onInit() {

    var token = GetStorage();

    super.onInit();
    if (!kReleaseMode) {
      findProxy = (url) =>
      'PROXY ${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:8080; DIRECT';
      allowAutoSignedCert = true;
    }

    baseUrl = 'https://dev.everestcloudsolutions.com/api/';

    httpClient.timeout = const Duration(seconds: 30);
  }
}