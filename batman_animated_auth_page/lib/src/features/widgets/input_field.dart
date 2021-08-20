import 'package:batman_animated_auth_page/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const InputField({
    Key? key,
    required this.label,
    this.isPassword = false,
  }) : super(key: key);

  final _border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: kSecondaryColor,
      width: 1.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height / 15.0,
        maxHeight:
            size.height > 800.0 ? (size.height / 10.0) : (size.height / 15.0),
        maxWidth: size.width * 0.8,
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: kSecondaryColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: _border,
          border: _border,
          suffixIcon: isPassword
              ? Container(
                  margin: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    'assets/batman_logo.png',
                    height: 15.0,
                    width: 15.0,
                    color: Colors.white,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
