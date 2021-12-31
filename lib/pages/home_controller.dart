import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final String url = "https://m.youtube.com/";
  final GlobalKey webViewKey = GlobalKey();

  void updateDislike(webController, title) async {
    Uri url = await webController.getUrl() ?? Uri();
    log(url.toString());
    Map<String, dynamic> data = await getData(url.toString());
    String source = "";
    if (data.isNotEmpty) {
      source = """
      document.querySelector(".slim-video-action-bar-actions").children[0].querySelector(".button-renderer-text").innerText = "${data['likes']}";
   document.querySelector(".slim-video-action-bar-actions").children[1].querySelector(".button-renderer-text").innerText = "${data['dislikes']}";
  """;
    }
    // try to update the dislike text 10 times
    for (int i = 0; i < 10; i++) {
      await webController.evaluateJavascript(source: source);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<Map<String, dynamic>> getData(String url) async {
    Map<String, dynamic> data = {};
    String baseUrl = "https://returnyoutubedislikeapi.com/votes?videoId=";
    List<String> parts = url.split("watch?v=");
    if (parts.length > 1) {
      String id = parts[1];
      Uri uri = Uri.parse(baseUrl + id);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        data = jsonDecode(utf8.decode(response.bodyBytes));
      }
    }
    return data;
  }
}
