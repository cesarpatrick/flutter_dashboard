import 'package:admin/models/WebUser.dart';
import 'package:admin/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Navigator.pushNamed(context, '/dashboard');
            },
          ),
          DrawerListTile(
            title: "Calendar",
            svgSrc: "assets/icons/calendar_icon.svg",
            press: () {
              Navigator.pushNamed(context, '/inventory');
            },
          ),
          DrawerListTile(
            title: "Depot",
            svgSrc: "assets/icons/recycling_icon.svg",
            press: () {
              Navigator.pushNamed(context, '/depot');
            },
          ),
          DrawerListTile(
            title: "Inventory",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Navigator.pushNamed(context, '/inventory');
            },
          ),
          DrawerListTile(
            title: "Truck History",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Sign Out",
            svgSrc: "assets/icons/exit_icon.svg",
            press: () {
              userService.setUser(Webuser());
              userService.updatePrefs("", "");
              userService.checkUserLoggedIn(context);
            },
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
