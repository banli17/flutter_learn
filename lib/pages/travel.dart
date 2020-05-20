import 'package:flutter/material.dart';
import 'package:flutter_template/components/dialog.dart';
//import 'package:fijkplayer/fijkplayer.dart';

class Travel extends StatelessWidget {
//  final FijkPlayer player = FijkPlayer();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
//      player.release();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('组件大全'),
        ),
        body: Column(children: <Widget>[
          Text('layout 组件'),
          Container(
              width: 100,
              height: 100,
              color: Colors.blue[50],
              child: Align(
                alignment: Alignment(-1, -1),
                child: Text('文件'),
              )),
          Container(
            child: GestureDetector(
              child: Text('ui布局 demo1'),
              onTap: ()=>{
                Navigator.pushNamed(context, 'ui_demo1_page')
              },
            ),
          )
        ]));
  }
}
