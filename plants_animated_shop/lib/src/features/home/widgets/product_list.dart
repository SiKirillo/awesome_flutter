import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/details/screens/details_screen.dart';
import 'package:plants_animated_shop/src/features/home/widgets/product_card.dart';
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
