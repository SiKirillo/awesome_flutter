import 'package:flutter/material.dart';
import 'package:adaptive_admin_page/models/my_file.dart';
import 'package:adaptive_admin_page/src/features/dashboard/components/file_info_card.dart';
import 'package:adaptive_admin_page/src/responsive.dart';

import '../../../../constants.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        const MyFilesTitle(),
        const SizedBox(
          height: defaultPadding,
        ),
        Responsive(
          mobile: MyFileDetails(
            crossAxisCount: size.width < 650.0 ? 2 : 4,
            childAspectRatio: size.width < 650.0 ? 1.3 : 1.0,
          ),
          desktop: MyFileDetails(
            childAspectRatio: size.width < 1400.0 ? 1.1 : 1.4,
          ),
          tablet: const MyFileDetails(),
        ),
      ],
    );
  }
}

class MyFilesTitle extends StatelessWidget {
  const MyFilesTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'My Files',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class MyFileDetails extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const MyFileDetails({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return FileInfoCard(info: demoMyFiles[index]);
      },
    );
  }
}
