import 'package:flutter/material.dart';
import 'package:adaptive_admin_page/src/responsive.dart';

import '../../../../constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2.0, vertical: defaultPadding / 2.0),
      margin: const EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.white10),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              'assets/images/profile_pic.png',
              height: 38.0,
            ),
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2.0),
              child: Text('Kiryl Samarychau'),
            ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
