import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/photo.controller.dart';

class PhotoScreen extends GetView<PhotoController> {
  const PhotoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PhotoScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
