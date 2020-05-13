import 'dart:convert';

import 'package:dio/dio.dart';

var dio = Dio();

class Http {
  static get(String url) async {
    var res = await dio.get(url);
    return json.decode(res.data);
  }

  static post() {}
}
