import 'dart:io';
import 'package:flui/flui.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';
import 'package:flutter_template/pages/my.dart';
import 'package:flutter_template/pages/other/wechat.dart';
import 'package:flutter_template/pages/ui/picker.dart';
import 'package:flutter_template/pages/ui/toast.dart';
import 'package:flutter_template/pages/ui_demo1_page.dart';
import 'package:flutter_template/pages/ui/appbar.dart';
import 'package:flutter_template/pages/video.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  Brightness _brightness = Brightness.light;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); // 添加监听器
    super.initState();
    setState(() {
//      _brightness = Brightness.dark;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      print('app进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('app 进入前台');
    } else if (state == AppLifecycleState.inactive) {
      // 不常用，应用程序处于非活动状态，并且未接受用户输入时调用，比如来了个电话
    } else if (state == AppLifecycleState.detached) {
      // 不常用，应用程序被挂起时调用，不会在 ios 上出发
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FLToastProvider(
        child: MaterialApp(
      color: Colors.red,
      title: 'flutter学习',
      theme: ThemeData(
        brightness: _brightness,
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: TabNavigator(),
      routes: <String, WidgetBuilder>{
        'my': (BuildContext context) => My(),
        'camera': (BuildContext context) => CameraApp(),
        'video_page': (BuildContext context) => VideoPage(),
        'ui_demo1_page': (BuildContext context) => UIDemo1Page(),
        'ui_appbar': (BuildContext context) => UIAppbar(),
        'ui_toast': (BuildContext context) => UIToast(),
        'ui_picker': (BuildContext context) => UIPicker(),
        'other_wechat': (BuildContext context) => OtherWechat(),
      },
    ));
  }
}
