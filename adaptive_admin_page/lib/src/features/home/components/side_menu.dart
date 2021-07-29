import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/logo.png'),
            ),
            DrawerListTile(
              title: 'Dashboard',
              svgSrc: 'assets/icons/menu_dashboard.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Transactions',
              svgSrc: 'assets/icons/menu_tran.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Task',
              svgSrc: 'assets/icons/menu_task.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Documents',
              svgSrc: 'assets/icons/menu_doc.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Store',
              svgSrc: 'assets/icons/menu_store.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Notification',
              svgSrc: 'assets/icons/menu_notification.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Profile',
              svgSrc: 'assets/icons/menu_profile.svg',
              callback: () {},
            ),
            DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/menu_setting.svg',
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, svgSrc;
  final VoidCallback callback;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white,
        height: 16.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
      horizontalTitleGap: 0.0,
      onTap: callback,
    );
  }
}
