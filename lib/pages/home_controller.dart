import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final String url = "https://m.youtube.com/";
  final GlobalKey webViewKey = GlobalKey();

  final String source = """
   document.querySelector(".slim-video-action-bar-actions").children[1].querySelector(".button-renderer-text").innerText = "13";
  """;

  void updateDislike(webController, title) async {
    Uri url = await webController.getUrl() ?? Uri();
    log(url.toString());
    // try to update the dislike text 10 times
    for (int i = 0; i < 10; i++) {
      await webController.evaluateJavascript(source: source);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
