import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paiChartSelectionData = [
      PieChartSectionData(
        value: 25.0,
        color: primaryColor,
        showTitle: false,
        radius: 25.0,
      ),
      PieChartSectionData(
        value: 20.0,
        color: const Color(0xFF26E5FF),
        showTitle: false,
        radius: 22.0,
      ),
      PieChartSectionData(
        value: 10.0,
        color: const Color(0xFFFFCF26),
        showTitle: false,
        radius: 19.0,
      ),
      PieChartSectionData(
        value: 15.0,
        color: const Color(0xFFEE2727),
        showTitle: false,
        radius: 16.0,
      ),
      PieChartSectionData(
        value: 10.0,
        color: primaryColor.withOpacity(0.1),
        showTitle: false,
        radius: 13.0,
      ),
    ];

    return SizedBox(
      height: 200.0,
      child: Stack(
        children: <Widget>[
          PieChart(
            PieChartData(
              sections: paiChartSelectionData,
              startDegreeOffset: -90.0,
              sectionsSpace: 0.0,
              centerSpaceRadius: 70.0,
            ),
          ),
          Positioned.fill(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  '29.1',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),
                const Text('of 128 GB'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
