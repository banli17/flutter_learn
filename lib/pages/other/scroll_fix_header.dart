import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const APPBAR_SCROLL_OFFSET = 100;

class FScrollFixHeader extends StatefulWidget {
  @override
  _FScrollFixHeader createState() => _FScrollFixHeader();
}

class _FScrollFixHeader extends State<FScrollFixHeader> {
  double appBarOpacity = 0; // 这里必须是 double

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    print(alpha);
    setState(() {
      appBarOpacity = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: NotificationListener(
              onNotification: (scrollNotification) {
                // 里面 swiper 滚动也会执行，scrollNotification.depth == 0 是 ListView
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  //滚动且是列表滚动时
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: Text('hi'))),
      Opacity(
          opacity: appBarOpacity,
          child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页'),
              ))))
    ]);
  }
}
