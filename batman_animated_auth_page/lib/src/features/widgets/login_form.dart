import 'package:batman_animated_auth_page/src/features/widgets/input_field.dart';
import 'package:batman_animated_auth_page/src/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final bool isLogin;
  final String buttonTitle;
  final VoidCallback buttonCallback;

  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.buttonTitle,
    required this.buttonCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          if (!isLogin) const InputField(
            label: 'FULL NAME',
          ),
          if (!isLogin) SizedBox(
            height: size.height * 0.02,
          ),
          const InputField(
            label: 'EMAIL',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const InputField(
            label: 'PASSWORD',
            isPassword: true,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          PrimaryButton(
            title: buttonTitle,
            callback: buttonCallback,
            isWelcomeScreen: false,
          ),
        ],
      ),
    );
  }
}
