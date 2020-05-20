import 'package:flutter/material.dart';
import 'package:flutter_template/api/home.dart';
import 'package:flutter_template/components/toast.dart';
import 'package:flutter_template/pages/tabview.dart';
import 'package:flutter_template/pages/video.dart';
import 'package:flutter_template/pages/webview.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';
import '../components/dialog.dart';
import 'camera.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('对话框'),
            onPressed: () {
              MDialog.alert(
                  context: context,
                  title: '标题',
                  content: '内容',
                  onRightPress: () {
                    print('press right button');
                  });
            },
          ),
          RaisedButton(
            child: Text('发送请求'),
            onPressed: () async {
              Map res = await ApiHome.getList();
              print(res['shop']);
            },
          ),
          RaisedButton(
            child: Text('拍照片'),
            onPressed: () async {
              await CameraApp.init();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraApp()));
            },
          ),
          RaisedButton(
            child: Text('打开网页 百度'),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MWebView(
                          url: 'https://m.baidu.com', hideAppBar: false)));
            },
          ),
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
