import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

class Price extends StatelessWidget {
  final String amount;

  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\$",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
        children: [
          TextSpan(
            text: amount,
            style: const TextStyle(color: Colors.black),
          ),
          const TextSpan(
            text: "/kg",
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
