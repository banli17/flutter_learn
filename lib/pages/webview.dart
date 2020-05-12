import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const CATCH_URLS = [];

class MWebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;
  final JavascriptMode javascriptMode;

  MWebView({
    this.url,
    this.statusBarColor,
    this.title = '标题',
    this.hideAppBar = false,
    this.backForbid = false,
    this.javascriptMode = JavascriptMode.unrestricted,
  });

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<MWebView> {
  final Completer<WebViewController> webviewReference =
  Completer<WebViewController>();

  bool exiting = false;
  num position = 1;

  @override
  void initState() {
    super.initState();
  }

  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  onPageStarted(String A) {
    setState(() {
      position = 1;
    });
  }

  onPageFinished(String A) {
    setState(() {
      position = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff'; // 状态栏颜色
    Color backButtonColor; // 返回按钮颜色
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

//    _appBar( Color(int.parse('0xff' + statusBarColorStr)), backButtonColor)
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
              initialUrl: widget.url,
              navigationDelegate: (NavigationRequest request) {
                return NavigationDecision.navigate;
              },
              onPageStarted: onPageStarted,
              onPageFinished: onPageFinished),
        Center(child: Text('加载中...')),
    ]
    )
    );
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }
    return Container(
      child: FractionallySizedBox(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.close,
                  color: backButtonColor,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(widget.title ?? '',
                    style: TextStyle(color: backButtonColor, fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
