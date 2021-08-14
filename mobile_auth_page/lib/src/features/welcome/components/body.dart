import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_auth_page/constants.dart';
import 'package:mobile_auth_page/src/features/login/screens/login_screen.dart';
import 'package:mobile_auth_page/src/features/register/screens/registration_screen.dart';
import 'package:mobile_auth_page/src/features/welcome/components/background.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_button.dart';
import 'package:mobile_auth_page/src/shared/components/top_screen_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void _loginButtonCallback(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  void _signUpButtonCallback(BuildContext context) {
    Navigator.of(context).pushNamed(RegistrationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TopScreenTitle(
              title: 'Welcome!',
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: 'Login',
              callback: _loginButtonCallback,
            ),
            RoundedButton(
              text: 'Sign up',
              callback: _signUpButtonCallback,
              buttonColor: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
