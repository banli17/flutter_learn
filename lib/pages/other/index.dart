import 'package:flutter/material.dart';
import 'package:flutter_template/api/home.dart';
import 'package:flutter_template/pages/tabview.dart';
import 'package:flutter_template/pages/video.dart';
import 'package:flutter_template/pages/webview.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';

//import '../components/dialog.dart';
//import '../components/datePicker.dart';
//import '../components/toast.dart';
//import 'camera.dart';
import 'package:fluwx/fluwx.dart';

class OtherPage extends StatefulWidget {
  @override
  _OtherPage createState() => _OtherPage();
}

class _OtherPage extends State<OtherPage> {
  final List data = [
    {
      'title': '常用第三方',
      'children': [
        {'title': '微信', 'url': 'other_wechat'},
      ]
    },
    {
      'title': '布局',
      'children': [
        {'title': 'App bar2', 'url': 'ui_appbar'}
      ]
    }
  ];

  _renderItem(item) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, item['url']);
        },
        child: Text(item['title']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabView(pageTitle: '插件', data: data, renderItem: _renderItem));
  }

  Widget build1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('插件'),
      ),
      body: Column(
        children: <Widget>[
//          RaisedButton(
//            child: Text('对话框'),
//            onPressed: () {
//              MDialog.alert(
//                  context: context,
//                  title: '标题',
//                  content: '内容',
//                  onRightPress: () {
//                    print('press right button');
//                  });
//            },
//          ),
//          RaisedButton(
//            child: Text('日期选择'),
//            onPressed: () {
//              DateTimePicker.show(
//                  context: context,
//                  onConfirm: (date) {
//                    print('点击时间为${date}');
//                  });
//            },
//          ),
          RaisedButton(
            child: Text('发送请求'),
            onPressed: () async {
              Map res = await ApiHome.getList();
              print(res['shop']);
            },
          ),
//          RaisedButton(
//            child: Text('提示信息'),
//            onPressed: () async {
//              MToast.info(msg: 'hello');
//            },
//          ),
//          RaisedButton(
//            child: Text('拍照片'),
//            onPressed: () async {
//              await CameraApp.init();
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => CameraApp()));
//            },
//          ),
//          RaisedButton(
//            child: Text('打开网页 百度'),
//            onPressed: () async {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => MWebView(
//                          url: 'https://m.baidu.com', hideAppBar: false)));
//            },
//          ),
//          RaisedButton(
//            child: Text('loading'),
//            onPressed: () async {
//              MToast.loading();
//            },
//          ),
          RaisedButton(
            child: Text('打开 tabview'),
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TabView()));
            },
          ),
          RaisedButton(
            child: Text('视频播放'),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VideoPage()));
            },
          ),
          RaisedButton(
            child: Text('测试路由router'),
            onPressed: () async {
              Navigator.pushNamed(context, 'video_page');
            },
          ),
//          RaisedButton(
//            child: Text('微信打开小程序'),
//            onPressed: () async {
//              await registerWxApi(
//                  appId: "wxbf8d954fb9e70108",
//                  universalLink: "https://your.univerallink.com/link/");
//              var result = await isWeChatInstalled;
//              if (!result) {
//                return MToast.info(msg: '没有安装微信');
//              }
//
//              MToast.info(msg: '安装了微信');
//              await launchWeChatMiniProgram(
//                  username: 'gh_48fd4fdef3fc',
//                  path: '/pages/home/index',
//                  miniProgramType: WXMiniProgramType.PREVIEW);
//            },
//          ),
          RaisedButton(
            child: Text('升级apk'),
            onPressed: () async {
              final permissionValidator = EasyPermissionValidator(
                context: context,
                appName: 'app名称',
                appNameColor: Colors.red,
                cancelText: '取消',
                enableLocationMessage: 'Debe habilitar',
                goToSettingsText: 'Ir a Configuraciones',
                permissionSettingsMessage: 'Necesita e',
              );
              var result = await permissionValidator.storage();
              if (result) {
                await RUpgrade.upgrade(
                    'http://gdown.baidu.com/data/wisegame/283e9789be54e63c/weixin_1560.apk',
                    apkName: 'app-release.apk',
                    isAutoRequestInstall: true);
              }
            },
          ),
        ],
      ),
    );
  }
}
