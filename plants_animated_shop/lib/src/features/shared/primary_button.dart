import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final double width;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.callback,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
          elevation: 1.0,
        ),
        onPressed: callback,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }
}
