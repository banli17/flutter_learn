import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("这是一个iOS风格的对话框"),
                      content: SizedBox(
                        height: 100.0,
                        child: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("第1行"),
                              Text("第2行"),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () {
                            Navigator.pop(context);
                            print("取消");
                          },
                        ),
                        FlatButton(
                          child: Text("确定"),
                          onPressed: () {
                            Navigator.pop(context);
                            print("确定");
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
