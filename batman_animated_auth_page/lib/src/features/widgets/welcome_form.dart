import 'package:batman_animated_auth_page/src/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class WelcomeForm extends StatelessWidget {
  final String primaryTitle;
  final VoidCallback primaryCallback;
  final String? secondaryTitle;
  final VoidCallback? secondaryCallback;

  const WelcomeForm({
    Key? key,
    required this.primaryTitle,
    required this.primaryCallback,
    this.secondaryTitle,
    this.secondaryCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          PrimaryButton(
            title: primaryTitle,
            callback: primaryCallback,
          ),
          if (secondaryTitle != null && secondaryCallback != null)
            SizedBox(
              height: size.height * 0.02,
            ),
          if (secondaryTitle != null && secondaryCallback != null)
            PrimaryButton(
              title: secondaryTitle!,
              callback: secondaryCallback!,
              isLeft: false,
            ),
        ],
      ),
    );
  }
}
