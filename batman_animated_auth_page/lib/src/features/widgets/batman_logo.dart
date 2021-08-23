import 'package:flutter/material.dart';

class BatmanLogo extends StatelessWidget {
  const BatmanLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image.asset(
      'assets/batman_logo.png',
      height: size.height / 14.0,
    );
  }
}
