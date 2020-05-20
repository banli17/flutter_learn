import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

List _imageUrls = [
  'https://goss.veer.com/creative/vcg/veer/800water/veer-150325295.jpg',
  'https://goss.veer.com/creative/vcg/veer/800water/veer-306536910.jpg',
  'https://goss.veer.com/creative/vcg/veer/800water/veer-147611740.jpg',
  'https://goss.veer.com/creative/vcg/veer/800water/veer-144466111.jpg'
];

class FSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图'),
      ),
      body: Swiper(
        itemCount: _imageUrls.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(_imageUrls[index], fit: BoxFit.fill);
        },
      ),
    );
  }
}
