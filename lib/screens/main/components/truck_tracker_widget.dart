//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class TruckTrackerWidget extends StatefulWidget {
  const TruckTrackerWidget({Key? key}) : super(key: key);

  @override
  _TruckTrackerWidgetState createState() => _TruckTrackerWidgetState();
}

class _TruckTrackerWidgetState extends State<TruckTrackerWidget> {
  late WebViewXController webviewController;

  // Set<EmbeddedJsContent> jsLogin() {
  //   Set<EmbeddedJsContent> jsContent = <EmbeddedJsContent>{};
  //   //js: "document.getElementById('cphBody_l1_txtPassword').value = 'Ces2RdlSM';   document.getElementById('cphBody_l1_txtUsername').value = 'cesar@rubbishdirect.co.nz';    document.getElementById('cphBody_l1_btnLogin').submit();"));

  //   jsContent.add(EmbeddedJsContent(
  //       js: "function funLoad() {     " +
  //           " document.getElementById('cphBody_l1_txtPassword').value = 'Ces2RdlSM';  " +
  //           " document.getElementById('cphBody_l1_txtUsername').value = 'cesar@rubbishdirect.co.nz';" +
  //           " document.getElementById('cphBody_l1_btnLogin').submit(); }"));

  //   return jsContent;
  // }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
      ),
      // child: WebViewX(
      //   initialSourceType: SourceType.html,
      //   initialContent: '<body onload="funLoad();"></body>',
      //   onWebViewCreated: (controller) {
      //     webviewController = controller;
      //     webviewController.loadContent(
      //       'https://t.trackit.co.nz/Login.aspx',
      //       SourceType.url,
      //     );
      //   },
      //   javascriptMode: JavascriptMode.unrestricted,
      //   jsContent: jsLogin(),
      //   height: screen.height,
      //   width: screen.width,
      // ),
    );
  }
}
