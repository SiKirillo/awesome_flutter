import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_auth_page/constants.dart';
import 'package:mobile_auth_page/src/features/login/components/background.dart';
import 'package:mobile_auth_page/src/features/login/components/bottom_account_check.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_button.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_input_field.dart';
import 'package:mobile_auth_page/src/shared/components/rounded_password_field.dart';
import 'package:mobile_auth_page/src/shared/components/text_field_container.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
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
            SizedBox(
              height: size.height * 0.03,
            ),
            BottomAccountCheck(
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}
