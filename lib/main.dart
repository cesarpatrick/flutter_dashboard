import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/page_not_found_screen.dart';
import 'package:admin/screens/auth/auth.dart';
import 'package:admin/screens/main/main_dashboard_screen.dart';
import 'package:admin/screens/main/main_inventory_screen.dart';
import 'package:admin/service/auth_key_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final AuthKeyService keyService = AuthKeyService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Workshop Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        initialRoute: LOGIN_ROUTE,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: const NotFoundPage())),
          );
        },
        routes: {
          // When navigating to the "/" route, build the Login widget.
          LOGIN_ROUTE: (context) => Auth(
                title: "Workshop Portal",
              ),
          // When navigating to the "/dashboard" route, build the Dashboard widget.
          DASHBOARD_ROUTE: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainDashboardScreen(),
              ),
          INVENTORY_ROUTE: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainInventoryScreen(),
              ),
        });
  }
}
