import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/details/screens/details_screen.dart';
import 'package:plants_animated_shop/src/features/shared/favorite_button.dart';
import 'package:plants_animated_shop/src/features/shared/price_label.dart';
import 'package:plants_animated_shop/src/models/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  void _onProductCardTap(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(
      DetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        kDefaultPadding,
        0.0,
        kDefaultPadding,
        kDefaultPadding,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft:
          Radius.circular(kDefaultPadding * 1.5),
          bottomRight:
          Radius.circular(kDefaultPadding * 1.5),
        ),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: demoProducts.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: kDefaultPadding,
          crossAxisSpacing: kDefaultPadding,
        ),
        itemBuilder: (context, index) =>
            ProductCard(
              product: demoProducts[index],
              callback: () =>
                  _onProductCardTap(
                    context,
                    demoProducts[index],
                  ),
            ),
      ),
    );
  }
}

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
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: kProductItemBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(kDefaultPadding * 1.25),
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
              tag: product.title,
              child: Image.asset(
                product.imageSrc,
                height: 130.0,
                width: 130.0,
                fit: BoxFit.cover,
              ),
            ),
            Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.title,
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
                    PriceLabel(amount: product.price),
                    FavoriteButton(
                      callback: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}