import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/shared/favorite_button.dart';
import 'package:plants_animated_shop/src/features/shared/price.dart';
import 'package:plants_animated_shop/src/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback callback;

  const ProductCard({
    Key? key,
    required this.product,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        decoration: const BoxDecoration(
          color: kProductItemBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(kDefaultPadding * 1.25),
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: product.title!,
              child: Image.asset(
                product.imageSrc!,
                height: 130.0,
                width: 130.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              product.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Fruits',
              style: Theme.of(context).textTheme.caption,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Price(amount: product.price!),
                FavoriteButton(
                  callback: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
