import 'dart:io';
import 'package:flui/flui.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';
import 'tab_navigator.dart';
import 'pages/camera.dart';

// 运行 app， 类似 React.createElement(<App/>, root)
void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// 页面、组件、元素都是 Widget
// StatelessWidget 相当于 Component
// build 相当于 render
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FLToastProvider(
        child: MaterialApp(
      color: Colors.red,
      title: 'flutter_名称',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: TabNavigator(),
    ));
  }
}
