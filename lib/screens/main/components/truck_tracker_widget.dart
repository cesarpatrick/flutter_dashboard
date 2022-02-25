import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class TruckTrackerWidget extends StatefulWidget {
  const TruckTrackerWidget({Key? key}) : super(key: key);

  @override
  _TruckTrackerWidgetState createState() => _TruckTrackerWidgetState();
}

class _TruckTrackerWidgetState extends State<TruckTrackerWidget> {
  late WebViewXController webviewController;

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
      child: WebViewX(
        initialSourceType: SourceType.html,
        initialContent: '<h2> Hello, world! </h2>',
        onWebViewCreated: (controller) {
          webviewController = controller;
          webviewController.loadContent(
            'https://t.trackit.co.nz/Tracking.aspx',
            SourceType.url,
          );
        },
        height: screen.height,
        width: screen.width,
      ),
    );
  }
}
