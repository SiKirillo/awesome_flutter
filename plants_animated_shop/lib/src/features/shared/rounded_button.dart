import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

class RoundedButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final VoidCallback callback;

  const RoundedButton({
    Key? key,
    required this.iconData,
    this.color = kPrimaryColor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      elevation: 0.0,
      color: Colors.white,
      height: 36.0,
      minWidth: 36.0,
      onPressed: callback,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
