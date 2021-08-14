import 'package:flutter/material.dart';
import 'package:mobile_auth_page/constants.dart';
import 'package:mobile_auth_page/src/features/login/screens/login_screen.dart';
import 'package:mobile_auth_page/src/features/register/screens/registration_screen.dart';

class BottomAccountCheck extends StatelessWidget {
  final bool hasAccount;

  const BottomAccountCheck({
    Key? key,
    this.hasAccount = true,
  }) : super(key: key);

  void _changeLoginMethod(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
        hasAccount ? LoginScreen.routeName : RegistrationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          hasAccount ? 'Don\'t have an account? ' : 'Already have an account? ',
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        ),
        InkWell(
          onTap: () => _changeLoginMethod(context),
          child: Text(
            hasAccount ? 'Sign in' : 'Sign up',
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
