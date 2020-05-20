import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';

class UIPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Picker'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('日期选择器'),
                  onPressed: () {
                    DateTimePicker.show(
                        context: context,
                        onConfirm: (date) {
                          print('点击时间为${date}');
                        });
                  },
                )
              ],
            )));
  }
}
