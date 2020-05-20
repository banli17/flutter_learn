import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/components/index.dart';
import 'package:fluwx/fluwx.dart';

class OtherWechat extends StatefulWidget {
  @override
  _OtherWechat createState() => _OtherWechat();
}

class _OtherWechat extends State<OtherWechat> {
  _initWechat() async {
    await registerWxApi(
        appId: "wxbf8d954fb9e70108",
        universalLink: "https://your.univerallink.com/link/");
  }

  @override
  void initState() {
    _initWechat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('微信'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Text('使用 fluwx 插件'),
                RaisedButton(
                  child: Text('检查微信是否安装'),
                  onPressed: () async {
                    var result = await isWeChatInstalled;
                    if (!result) {
                      return MToast.info(msg: '没有安装微信');
                    }

                    MToast.info(msg: '安装了微信');
                  },
                ),
                RaisedButton(
                  child: Text('微信登录'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('微信支付'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('微信打开小程序'),
                  onPressed: () async {
                    await launchWeChatMiniProgram(
                        username: 'gh_48fd4fdef3fc',
                        path: '/pages/home/index',
                        miniProgramType: WXMiniProgramType.PREVIEW);
                  },
                ),
                RaisedButton(
                  child: Text('微信分享朋友圈'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('微信收藏'),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享文字'),
                  onPressed: () {
                    shareToWeChat(WeChatShareTextModel("分享的文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享小程序'),
                  onPressed: () {
                    shareToWeChat(WeChatShareTextModel("分享文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享图片'),
                  onPressed: () {
                    shareToWeChat(WeChatShareImageModel(
                        WeChatImage.asset('share.jpg'),
                        title: "分享文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享网页'),
                  onPressed: () {
                    shareToWeChat(WeChatShareTextModel("分享文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享音频'),
                  onPressed: () {
                    shareToWeChat(WeChatShareTextModel("分享文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享视频'),
                  onPressed: () {
                    shareToWeChat(WeChatShareTextModel("分享文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
                RaisedButton(
                  child: Text('微信分享到朋友 - 分享文件'),
                  onPressed: () {
                    shareToWeChat(WeChatShareTextModel("分享文字",
                        scene: WeChatScene.SESSION));
                  },
                ),
              ],
            )));
  }
}
