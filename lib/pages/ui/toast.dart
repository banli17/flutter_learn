import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';

class UIToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Toast'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    MToast.info(msg: '成功了');
                  },
                  child: Text('成功提示'),
                ),
                RaisedButton(
                  onPressed: () {
                    MToast.loading(msg: '正在加载中', delay: 1);
                  },
                  child: Text('加载中'),
                )
              ],
            )));
  }
}
