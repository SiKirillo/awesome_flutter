import 'package:flutter/material.dart';
import 'package:mobile_auth_page/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget horizontalDivider = const Expanded(
      child: Divider(
        color: dividerColor,
        height: 1.5,
      ),
    );

    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          horizontalDivider,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'OR',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          horizontalDivider,
        ],
      ),
    );
  }
}
