import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/options_controller.dart';

class OptionsView extends GetView<OptionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OptionsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OptionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
