import 'package:flutter/material.dart';
import 'package:mobile_auth_page/constants.dart';

class BottomAccountCheck extends StatelessWidget {
  final bool hasAccount;
  final Function callback;

  const BottomAccountCheck({
    Key? key,
    this.hasAccount = true,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          hasAccount ? 'Don\'t have an account? ' : 'Already have an account? ',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        InkWell(
          onTap: () => callback(),
          child: Text(
            hasAccount ? 'Sign up' : 'Sign in',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
