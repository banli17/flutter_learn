import 'package:flutter/material.dart';

class Travel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旅拍'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('返回'),
            onPressed: () {
              Navigator.pop(context, '哈哈');
            },
          ),
        ],
      ),
    );
  }
}
