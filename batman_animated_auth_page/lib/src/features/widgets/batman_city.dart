import 'package:flutter/material.dart';

class BatmanCity extends AnimatedWidget {
  const BatmanCity({required Animation animation, Key? key})
      : super(listenable: animation, key: key);

  Animation get _animation => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CityClipper(progress: _animation.value),
      child: Image.asset('assets/city.png'),
    );
  }
}

class _CityClipper extends CustomClipper<Path> {
  final double progress;

  const _CityClipper({required this.progress});

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 2, size.height * (1 - progress))
      ..lineTo(0.0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
