import 'package:flutter/material.dart';
import 'package:plants_animated_shop/src/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeaderHeight,
      color: Colors.white,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Good Morning!',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                'Caesar Rincon',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              )
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/profile.png'),
          )
        ],
      ),
    );
  }
}
