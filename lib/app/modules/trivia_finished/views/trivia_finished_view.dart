import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trivia_finished_controller.dart';

class TriviaFinishedView extends GetView<TriviaFinishedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TriviaFinishedView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TriviaFinishedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
