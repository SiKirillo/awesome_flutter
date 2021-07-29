import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class StorageInfoCard extends StatelessWidget {
  final String title, svgSrc, amountOfFiles;
  final int numOfFiles;

  const StorageInfoCard({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.amountOfFiles,
    required this.numOfFiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.only(top: defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: primaryColor.withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$numOfFiles Files',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                  Text(
                    amountOfFiles,
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
