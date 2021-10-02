class GlobalSummaryModel {
  final int todayCases;
  final int cases;
  final int todayDeaths;
  final int deaths;
  final int todayRecovered;
  final int recovered;
  final int active;
  // final DateTime date;

  GlobalSummaryModel(
      {required this.todayCases,
      required this.cases,
      required this.todayDeaths,
      required this.deaths,
      required this.todayRecovered,
      required this.recovered,
      required this.active,
      //required this.date
      });

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) {
    return GlobalSummaryModel(
      todayCases: json["todayCases"],
      cases: json["cases"],
      todayDeaths:json["todayDeaths"],
      deaths:json["deaths"],
      todayRecovered:json["todayRecovered"],
      recovered:json["recovered"],
      active:json["active"],
      // date:DateTime.parse(json["Date"]),
    );
  }
}
