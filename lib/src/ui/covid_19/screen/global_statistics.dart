// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ggmap/src/constants/color.dart';
import 'package:ggmap/src/ui/covid_19/models/global_summary.dart';

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel? summary;

  GlobalStatistics({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCard(
          "Tổng Ca Nhiễm Covid Ghi Nhận",
          summary?.cases ?? 0,
          summary?.todayCases ?? 0,
          kConfirmedColor,
        ),
        buildCard(
          "Tổng Số Ca Hiện Tại",
          summary?.active ?? 0,
          summary?.todayCases ?? 0,
          kActiveColor,
        ),
        buildCard(
          "Tổng Số Ca Hồi Phục",
          summary?.recovered ?? 0,
          summary?.todayRecovered ?? 0,
          kRecoveredColor,
        ),
        buildCard(
          "Tổng Số Ca Chết",
          summary?.deaths ?? 0,
          summary?.todayDeaths ?? 0,
          kRecoveredColor,
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
          height: 90,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tổng",
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                          totalCount.toString().replaceAllMapped(
                              reg, (Match match) => '${match[1]}.'),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hôm nay",
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                          todayCount.toString().replaceAllMapped(
                              reg, (Match match) => '${match[1]}.'),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ))
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
