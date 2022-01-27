import 'package:flutter/material.dart';
import 'package:ggmap/src/constants/color.dart';
import 'package:ggmap/src/ui/covid_19/models/country.dart';

class CountryStatistics extends StatelessWidget {
  final List<CountryModel> summaryList;

  CountryStatistics({required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "Số Ca Ghi Nhận",
          summaryList[summaryList.length - 1].cases,
          kConfirmedColor,
          "Số Ca Nhiễm",
          summaryList[summaryList.length - 1].active,
          kActiveColor,
        ),
        buildCard(
          "Số Ca Hồi Phục",
          summaryList[summaryList.length - 1].recovered,
          kRecoveredColor,
          "Số Ca Chết",
          summaryList[summaryList.length - 1].deaths,
          kDeathColor,
        ),
        buildCard(
          "Ca Nhiễm / Ngày",
          summaryList[summaryList.length - 1].todayCases,
          kConfirmedColor,
          "Ca Nhiễm / 1 Triệu",
          summaryList[summaryList.length - 1].casesPerOneMillion,
          kConfirmedColor,
        ),
        buildCard(
          "Ca Hồi Phục / Ngày",
          summaryList[summaryList.length - 1].todayRecovered,
          kRecoveredColor,
          "Ca Chết / Ngày",
          summaryList[summaryList.length - 1].todayDeaths,
          kDeathColor,
        ),
      ],
    );
  }

  Widget buildCard(String leftTitle, int leftValue, Color leftColor,
      String rightTitle, int rightValue, Color rightColor) {
    return Card(
      elevation: 1,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  leftValue
                      .toString()
                      .replaceAllMapped(reg, (Match match) => '${match[1]}.'),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  rightValue
                      .toString()
                      .replaceAllMapped(reg, (Match match) => '${match[1]}.'),
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
