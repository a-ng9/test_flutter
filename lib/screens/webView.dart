import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View of Partial'),
      ),
      body: WebView(
        initialUrl: "https://www.partial.gallery/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      /////////////Below code will redirect you to another website (to interact change the webview)
      // floatingActionButton: FutureBuilder<WebViewController>(
      //   future: _controller.future,
      //   builder: (BuildContext context,
      //       AsyncSnapshot<WebViewController> controller) {
      //     if (controller.hasData) {
      //       return FloatingActionButton(
      //         child: Icon(Icons.ac_unit),
      //         onPressed: () {
      //           controller.data.loadUrl('https://youtube.com');
      //         },
      //       );
      //     }
      //     return null;
      //   },
      // ),
    );
  }
}
