import 'package:flutter/material.dart';

class MDialog {
  static alert(
      {context,
      String title = '',
      String content = '',
      leftButtonText = '确定',
      rightButtonText = '取消',
      onLeftPress,
      onRightPress}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              child: SingleChildScrollView(
                child: Text(content),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(leftButtonText),
                onPressed: () {
                  Navigator.pop(context);
                  print("确定");
                  if (onLeftPress is Function) {
                    onLeftPress();
                  }
                },
              ),
              FlatButton(
                child: Text("取消", style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                  print("取消");
                  if (onRightPress is Function) {
                    onRightPress();
                  }
                },
              ),
            ],
          );
        });
  }

  static confirm(
      {context,
      String title = '',
      String content = '',
      leftButtonText = '确定',
      rightButtonText = '取消',
      onLeftPress,
      onRightPress}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              child: SingleChildScrollView(
                child: Text(content),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(leftButtonText),
                onPressed: () {
                  Navigator.pop(context);
                  print("确定");
                  if (onLeftPress is Function) {
                    onLeftPress();
                  }
                },
              ),
              FlatButton(
                child: Text("取消", style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                  print("取消");
                  if (onRightPress is Function) {
                    onRightPress();
                  }
                },
              ),
            ],
          );
        });
  }
}
