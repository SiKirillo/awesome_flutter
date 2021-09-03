import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

class PriceLabel extends StatelessWidget {
  final double amount;

  const PriceLabel({
    Key? key,
    this.amount = 66.66,
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
            text: amount.toString(),
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
