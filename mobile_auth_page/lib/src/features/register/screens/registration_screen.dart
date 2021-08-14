import 'package:flutter/material.dart';
import 'package:mobile_auth_page/src/features/register/components/body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
