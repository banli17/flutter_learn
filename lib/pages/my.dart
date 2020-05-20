import 'package:flutter/material.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  double moveX = 0;
  double moveY = 0;

  _printMsg(String msg) {
    print('msg : $msg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () => _printMsg('点击'),
                onDoubleTap: () => _printMsg('双击'),
                onLongPress: () => _printMsg('长按'),
                onTapCancel: () => _printMsg('取消'),
                onTapUp: (e) => _printMsg('松开'),
                onTapDown: (e) => _printMsg('按下'),
                child: Text('用户操作'),
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                    onPanUpdate: (e) => _doMove(e),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(36)),
                    )),
              )
            ],
          ),
        ));
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
}
