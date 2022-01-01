import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return WillPopScope(
      onWillPop: controller.goBack,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: InAppWebView(
          key: controller.webViewKey,
          initialUrlRequest: URLRequest(
              url: MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Uri.parse(controller.url + "?theme=dark")
                  : Uri.parse(controller.url)),
          onWebViewCreated: (webController) {
            controller.webViewController = webController;
          },
          onTitleChanged: controller.updateDislike,
          onExitFullscreen: controller.exitFullscreen,
          onEnterFullscreen: (webController) {
            controller.enterFullscreen(webController, context);
          },
        ),
      ),
    );
  }
}
