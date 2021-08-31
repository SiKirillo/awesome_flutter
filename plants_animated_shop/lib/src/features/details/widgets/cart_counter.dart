import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/shared/rounded_button.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          RoundedButton(
            iconData: Icons.remove,
            color: Colors.black38,
            callback: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 4.0),
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RoundedButton(
            iconData: Icons.add,
            callback: () {},
          ),
        ],
      ),
    );
  }
}
