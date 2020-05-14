import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class CameraApp extends StatefulWidget {
  static List<CameraDescription> cameras;

  static init() async {
    cameras = await availableCameras();
  }

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  _initCamera() async {
    controller =
        CameraController(CameraApp.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
}
