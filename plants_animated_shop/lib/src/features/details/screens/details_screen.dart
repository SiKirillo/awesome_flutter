import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/details/widgets/product_image.dart';
import 'package:plants_animated_shop/src/features/details/widgets/product_top_description.dart';
import 'package:plants_animated_shop/src/features/shared/content_wrapper.dart';
import 'package:plants_animated_shop/src/features/shared/favorite_button.dart';
import 'package:plants_animated_shop/src/features/shared/primary_button.dart';
import 'package:plants_animated_shop/src/features/shared/scrollable_wrapper.dart';
import 'package:plants_animated_shop/src/models/product.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';
  final Product product;

  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void _onAddToCartButtonHandler() {
    context.read<HomeController>().addProductToCart(widget.product);
    Navigator.of(context).pop();
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kAppBarHeight),
      child: AppBar(
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
        actions: <Widget>[
          FavoriteButton(
            radius: 20.0,
            isSmall: false,
            callback: () {},
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          ProductImage(
            heroTag: widget.product.title,
            imageSrc: widget.product.imageSrc,
          ),
          Expanded(
            child: ContentWrapper(
              widget: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  const SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  ProductTopDescription(
                    title: widget.product.title,
                    price: widget.product.price,
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2.0,
                  ),
                  const Expanded(
                    child: ScrollableWrapper(
                      widgets: <Widget>[
                        Text(
                          'Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).',
                          style: TextStyle(
                            color: Color(0xFFBDBDBD),
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      const SizedBox(
                        height: kDefaultPadding / 2.0,
                      ),
                      PrimaryButton(
                        title: 'Add to Cart',
                        callback: _onAddToCartButtonHandler,
                      ),
                      const SizedBox(
                        height: kDefaultPadding / 2.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
