import 'package:flutter/material.dart';

class BatmanCity extends AnimatedWidget {
  const BatmanCity({required Animation animation, Key? key})
      : super(listenable: animation, key: key);

  Animation get _animation => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: _CityClipper(
        progress: _animation.value,
        padding: size.width * 0.07,
      ),
      child: Image.asset('assets/city.png'),
    );
  }
}

class _CityClipper extends CustomClipper<Path> {
  final double progress;
  final double padding;

  const _CityClipper({
    required this.progress,
    required this.padding,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0.0, size.height)
      ..lineTo(size.width - padding, size.height)
      ..lineTo(size.width - padding, size.height - padding)
      ..lineTo(size.width - padding / 1.5, size.height - padding)
      ..lineTo(size.width / 2, size.height * (1 - progress))
      ..lineTo(padding / 1.5, size.height - padding)
      ..lineTo(padding, size.height - padding)
      ..lineTo(padding, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
