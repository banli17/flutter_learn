import 'package:flui/flui.dart';

class MToast {
  static info({String msg = ''}) {
    FLToast.showText(text: msg);
  }

  static loading({String msg = '加载中...', int delay = 2}) {
    var dismiss = FLToast.loading(text: msg);

    /// do something...
    Future.delayed(Duration(seconds: delay), () {
      /// hide toast
      dismiss();
    });
  }
}
