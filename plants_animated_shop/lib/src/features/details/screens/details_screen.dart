import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/features/details/widgets/cart_counter.dart';
import 'package:plants_animated_shop/src/features/shared/favorite_button.dart';
import 'package:plants_animated_shop/src/features/shared/price.dart';
import 'package:plants_animated_shop/src/models/product.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Fruits',
        style: TextStyle(color: Colors.black),
      ),
      actions: const <Widget>[
        FavoriteButton(radius: 20.0),
        SizedBox(width: kDefaultPadding),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF8F8F8),
                  child: Image.asset(widget.product.imageSrc!),
                ),
                const Positioned(
                  bottom: -20.0,
                  child: CartCounter(),
                )
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Price(amount: '20.00'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Text(
              'Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).',
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}