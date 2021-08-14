import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_auth_page/src/features/register/components/background.dart';
import 'package:mobile_auth_page/src/features/register/components/or_divider.dart';
import 'package:mobile_auth_page/src/features/register/components/social_links.dart';
import 'package:mobile_auth_page/src/shared/components/bottom_account_check.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_button.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_input_field.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_password_field.dart';
import 'package:mobile_auth_page/src/shared/components/top_screen_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height - MediaQuery
        .of(context)
        .viewPadding
        .vertical;

    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TopScreenTitle(
                title: 'Sign up',
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: screenHeight * 0.3,
              ),
              SizedBox(
                height: screenHeight * 0.03,
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
                      text: 'Sign up',
                      callback: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              const BottomAccountCheck(
                hasAccount: true,
              ),
              const OrDivider(),
              const SocialLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
