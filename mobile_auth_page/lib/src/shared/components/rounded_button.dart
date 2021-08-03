import 'package:flutter/material.dart';
import 'package:mobile_auth_page/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function callback;
  final Color buttonColor, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.callback,
    this.buttonColor = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          ),
          onPressed: () => callback(context),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
