import 'package:flutter/material.dart';
import 'package:adaptive_admin_page/constants.dart';
import 'package:adaptive_admin_page/controllers/menu_controller.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/my_files.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/profile_card.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/recent_files.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/search_field.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/storage_details.dart';
import 'package:adaptive_admin_page/src/responsive.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Flex(
          direction: Axis.vertical,
          children: const <Widget>[
            DashboardHeader(),
            SizedBox(height: defaultPadding),
            DashboardBody(),
          ],
        ),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void menuCallback() {
      context.read<MenuController>().controlMenu();
    }

    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        /// Don't show menu button in desktop version
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: menuCallback,
            ),
          ),
        if (!Responsive.isMobile(context))
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        const Expanded(
          child: SearchField(),
        ),
        const ProfileCard(),
      ],
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              const MyFiles(),
              const SizedBox(
                height: defaultPadding,
              ),
              const RecentFiles(),

              /// Show right [StorageDetails] only in mobile version
              if (Responsive.isMobile(context))
                const SizedBox(
                  height: defaultPadding,
                ),
              if (Responsive.isMobile(context)) const StorageDetails(),
            ],
          ),
        ),

        /// Don't show right [StorageDetails] in mobile version
        if (!Responsive.isMobile(context))
          const SizedBox(
            width: defaultPadding,
          ),
        if (!Responsive.isMobile(context))
          const Expanded(
            flex: 2,
            child: StorageDetails(),
          ),
      ],
    );
  }
}
