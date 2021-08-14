import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_auth_page/src/features/login/components/background.dart';
import 'package:mobile_auth_page/src/shared/components/bottom_account_check.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_button.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_input_field.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_password_field.dart';
import 'package:mobile_auth_page/src/shared/components/top_screen_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.vertical;

    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TopScreenTitle(
                title: 'Login',
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: screenHeight * 0.36,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Form(
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    RoundedInputField(
                      hintText: 'Your email',
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: 'Login',
                      callback: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const BottomAccountCheck(
                hasAccount: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
