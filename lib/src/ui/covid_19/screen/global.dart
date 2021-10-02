import 'package:flutter/material.dart';
import 'package:ggmap/src/ui/covid_19/models/global_summary.dart';
import 'package:ggmap/src/ui/covid_19/screen/global_loading.dart';
import 'package:ggmap/src/ui/covid_19/screen/global_statistics.dart';
import 'package:ggmap/src/ui/covid_19/services/covid_service.dart';

CovidService covidService = new CovidService();

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future<GlobalSummaryModel>? summary;
  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Covid 19 Trên Thế Giới",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    summary = covidService.getGlobalSummary();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        FutureBuilder<GlobalSummaryModel>(
          future: summary,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return GlobalLoading();
              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text(
                          "Empty",
                        ),
                      )
                    : GlobalStatistics(
                        summary: snapshot.data,
                      );
            }
          },
        )
      ],
    );
  }
}
