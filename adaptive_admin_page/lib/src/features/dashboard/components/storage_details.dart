import 'package:flutter/material.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/chart.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/storage_info_card.dart';

import '../../../../constants.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Storage Details',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            title: 'Documents Files',
            svgSrc: 'assets/icons/documents.svg',
            amountOfFiles: '1.3 GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            title: 'Media Files',
            svgSrc: 'assets/icons/media.svg',
            amountOfFiles: '15.3 GB',
            numOfFiles: 6324,
          ),
          StorageInfoCard(
            title: 'Other Files',
            svgSrc: 'assets/icons/folder.svg',
            amountOfFiles: '1.1 GB',
            numOfFiles: 658,
          ),
          StorageInfoCard(
            title: 'Unknown',
            svgSrc: 'assets/icons/unknown.svg',
            amountOfFiles: '0.6 GB',
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
