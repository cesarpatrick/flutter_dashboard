import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 3),
  //   )..addListener(() {
  //       //  setState(() {});
  //     });
  //   controller.repeat(reverse: false);
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Container(
    //     padding: EdgeInsets.all(defaultPadding),
    //     decoration: BoxDecoration(color: bgColor),
    //     child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           SizedBox(
    //               width: 50,
    //               height: 50,
    //               child: CircularProgressIndicator(
    //                 color: Colors.blue,
    //                 value: controller.value,
    //               ))
    //         ]));
  }
}
