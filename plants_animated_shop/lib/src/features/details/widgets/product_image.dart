import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

import 'cart_counter.dart';

class ProductImage extends StatelessWidget {
  final String heroTag;
  final String imageSrc;

  const ProductImage({
    Key? key,
    required this.heroTag,
    required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productImageHeight = (size.height / 2.5) - kAppBarHeight;

    return SizedBox(
      height: productImageHeight,
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1.37,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              color: kImageBackgroundColor,
              child: Hero(
                tag: heroTag,
                child: Image.asset(imageSrc),
              ),
            ),
            const Positioned(
              bottom: -20.0,
              child: CartCounter(),
            ),
          ],
        ),
      ),
    );
  }
}
