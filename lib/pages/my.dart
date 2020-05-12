import 'package:flutter/material.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
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
