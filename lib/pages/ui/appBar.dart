import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('app bar标题'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text('返回'), // 可定制， 默认为返回按钮图标
              ),
            )),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Text('说明\n'
              '属性：\n'
              '- title'),
        ));
  }
}
