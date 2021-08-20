import 'package:batman_animated_auth_page/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool isLeft;
  final bool isWelcomeScreen;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.callback,
    this.isLeft = true,
    this.isWelcomeScreen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: kPrimaryButtonColor,
      child: InkWell(
        onTap: callback,
        child: ClipRect(
          child: Container(
            constraints: BoxConstraints(
              minHeight: size.height / 15.0,
              maxHeight: size.height > 800.0 || isWelcomeScreen
                  ? (size.height / 13.0)
                  : (size.height / 15.0),
              maxWidth: size.width * 0.8,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                if (isLeft)
                  Positioned(
                    left: 0.0,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(vector.radians(35.0)),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: size.height / 15.0,
                        color: kSecondaryButtonColor,
                      ),
                    ),
                  ),
                if (!isLeft)
                  Positioned(
                    right: 0.0,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(vector.radians(-35.0)),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: size.height / 15.0,
                        color: kSecondaryButtonColor,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
