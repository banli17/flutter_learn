import '_http.dart';

class ApiHome {
  static getList() async {
    const url =
        'https://suggest.taobao.com/sug?code=utf-8&q=%E8%8B%B9%E6%9E%9C';
    return await Http.get(url);
  }
}
