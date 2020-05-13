import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

class Travel extends StatelessWidget {
  final FijkPlayer player = FijkPlayer();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      player.release();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('旅拍'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: FijkView(
            player: player,
          ),
        ));
  }
}
