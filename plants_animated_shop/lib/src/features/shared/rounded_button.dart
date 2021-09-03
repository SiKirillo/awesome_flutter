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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 36.0,
        width: 36.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            elevation: 0.5,
          ),
          onPressed: callback,
          child: Icon(
            iconData,
            color: color,
          ),
        ),
      ),
    );
  }
}
