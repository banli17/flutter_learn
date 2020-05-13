import 'package:flutter/material.dart';
import 'package:flutter_template/api/home.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';
import '../components/dialog.dart';
import '../components/datePicker.dart';
import '../components/toast.dart';

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
            child: Text('日期选择'),
            onPressed: () {
              DateTimePicker.show(
                  context: context,
                  onConfirm: (date) {
                    print('点击时间为${date}');
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
            child: Text('提示信息'),
            onPressed: () async {
              MToast.info(msg: 'hello');
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
                enableLocationMessage:
                    'Debe habilitar los permisos necesarios para utilizar la acción.',
                goToSettingsText: 'Ir a Configuraciones',
                permissionSettingsMessage:
                    'Necesita habilitar los permisos necesarios para que la aplicación funcione correctamente',
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
