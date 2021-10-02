class CountrySummaryModel {
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;

  CountrySummaryModel(
      {required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active});

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
      cases: json["cases"],
      todayCases: json["todayCases"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"],
      todayRecovered: json["todayRecovered"],
      active: json["active"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["todayCases"] = this.todayCases;
    data["cases"] = this.cases;
    data["deaths"] = this.deaths;
    data["todayDeaths"] = this.todayDeaths;
    data["recovered"] = this.recovered;
    data["todayRecovered"] = this.todayRecovered;
    data["active"] = this.active;
    return data;
  }
}
