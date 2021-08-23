import 'package:batman_animated_auth_page/constants.dart';
import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final String? subtitle, description;

  const ScreenTitle({
    Key? key,
    required this.title,
    this.subtitle,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        if (subtitle != null)
          Text(
            subtitle!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38.0,
          ),
          textAlign: TextAlign.center,
        ),
        if (description != null)
          Text(
            description!,
            style: const TextStyle(
              color: kSecondaryColor,
              fontSize: 12.0,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
