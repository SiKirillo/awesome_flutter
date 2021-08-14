import 'package:flutter/material.dart';
import 'package:mobile_auth_page/constants.dart';
import 'package:mobile_auth_page/src/shared/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    this.hintText = 'Your password',
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isObscure = true;

  void _changeObscureCallback() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 24.0,
            minWidth: 24.0,
          ),
          suffixIcon: InkWell(
            onTap: _changeObscureCallback,
            child: const Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
