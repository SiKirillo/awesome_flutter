import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/shared/rounded_button.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int _counter = 1;

  void _onAddProductHandler() {
    setState(() {
      _counter++;
    });
  }

  void _onRemoveProductHandler() {
    setState(() {
      _counter > 0 ? _counter-- : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kCounterBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          RoundedButton(
            iconData: Icons.remove,
            color: Colors.black38,
            callback: _onRemoveProductHandler,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4.0),
            child: Text(
              _counter.toString(),
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RoundedButton(
            iconData: Icons.add,
            callback: _onAddProductHandler,
          ),
        ],
      ),
    );
  }
}
