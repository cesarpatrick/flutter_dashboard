import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'a_service_form.dart';

class WorkshopFormScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: controller,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "",
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      AServiceForm(
                        onChanged: (value) {
                          controller.animateTo(
                            0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                      ),
                      SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
