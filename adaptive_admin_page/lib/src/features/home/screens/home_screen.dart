import 'package:flutter/material.dart';
import 'package:adaptive_admin_page/controllers/menu_controller.dart';
import 'package:adaptive_admin_page/src/features/dashboard/screens/dashboard_screen.dart';
import 'package:adaptive_admin_page/src/features/home/components/side_menu.dart';
import 'package:adaptive_admin_page/src/responsive.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Show side menu only for desktop
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            const Expanded(
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
