import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/shared/content_wrapper.dart';
import 'package:plants_animated_shop/src/features/shared/scrollable_wrapper.dart';
import 'package:provider/provider.dart';

class CartShortView extends StatelessWidget {
  const CartShortView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return ContentWrapper(
      widget: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Text(
            'Cart',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
            child: ScrollableWrapper(
              direction: Axis.horizontal,
              widgets: List.generate(
                controller.cart.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding / 3.0),
                    child: Hero(
                      tag: controller.cart[index].product!.title + '_cartTag',
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage(controller.cart[index].product!.imageSrc),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              controller.totalCartItems().toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
