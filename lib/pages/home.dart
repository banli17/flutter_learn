import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'webview.dart';

List _imageUrls = [
  'https://goss.veer.com/creative/vcg/veer/800water/veer-150325295.jpg',
  'https://goss.veer.com/creative/vcg/veer/800water/veer-306536910.jpg',
  'https://goss.veer.com/creative/vcg/veer/800water/veer-147611740.jpg',
  'https://goss.veer.com/creative/vcg/veer/800water/veer-144466111.jpg'
];

const APPBAR_SCROLL_OFFSET = 100;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
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
    return Scaffold(
        body: Stack(children: <Widget>[
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
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 180,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(_imageUrls[index],
                            fit: BoxFit.fill);
                      },
                    ),
                  ),
                  Container(
                    height: 1800,
                    child: GestureDetector(
                      child: ListTile(
                        title: Text('打开百度 webview'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MWebView(
                                          url: 'https://m.baidu.com',
                                          hideAppBar: false)));
                        },
                      ),
                    ),
                  )
                ],
              ))),
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
    ]));
  }
}
