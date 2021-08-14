import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_auth_page/constants.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          iconSrc: 'assets/icons/facebook.svg',
          callback: () {},
        ),
        SocialIcon(
          iconSrc: 'assets/icons/twitter.svg',
          callback: () {},
        ),
        SocialIcon(
          iconSrc: 'assets/icons/google-plus.svg',
          callback: () {},
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function callback;

  const SocialIcon({
    Key? key,
    required this.iconSrc,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => callback,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20.0,
          width: 20.0,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
