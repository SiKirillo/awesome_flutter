import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/shared/price.dart';
import 'package:plants_animated_shop/src/models/product_item.dart';

class CardDetailsScreen extends StatelessWidget {
  final ProductItem item;

  const CardDetailsScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: kDefaultPadding / 2.0),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(item.product!.imageSrc!),
      ),
      title: Text(
        item.product!.title!,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            const Price(amount: '20'),
            Text(
              "  x ${item.quantity}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
