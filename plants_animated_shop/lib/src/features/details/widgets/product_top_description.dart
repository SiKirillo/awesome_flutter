import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/features/shared/price_label.dart';

class ProductTopDescription extends StatelessWidget {
  final String title;
  final double price;

  const ProductTopDescription({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        PriceLabel(amount: price),
      ],
    );
  }
}
