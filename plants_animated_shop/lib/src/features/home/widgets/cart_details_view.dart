import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';
import 'package:plants_animated_shop/src/controllers/home_controller.dart';
import 'package:plants_animated_shop/src/features/shared/content_wrapper.dart';
import 'package:plants_animated_shop/src/features/shared/price_label.dart';
import 'package:plants_animated_shop/src/features/shared/primary_button.dart';
import 'package:plants_animated_shop/src/features/shared/scrollable_wrapper.dart';
import 'package:plants_animated_shop/src/models/product_item.dart';
import 'package:provider/provider.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    String getTotalAmount() {
      return controller.cart
          .fold<double>(
              0.0,
              (previousValue, item) =>
                  previousValue + item.product!.price * item.quantity)
          .toString();
    }

    return ContentWrapper(
      widget: Flex(
        direction: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding / 2.0),
            child: Text(
              'Cart',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ScrollableWrapper(
              widgets: [
                ...List.generate(
                  controller.cart.length,
                  (index) {
                    return CartDetailsViewCard(
                      productItem: controller.cart[index],
                    );
                  },
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                PrimaryButton(
                  title: 'Next  -  \$${getTotalAmount()}',
                  callback: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartDetailsViewCard extends StatelessWidget {
  final ProductItem productItem;

  const CartDetailsViewCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: kDefaultPadding / 2.0),
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product!.imageSrc),
      ),
      title: Text(
        productItem.product!.title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            PriceLabel(amount: productItem.product!.price),
            Text(
              "  x ${productItem.quantity}",
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
