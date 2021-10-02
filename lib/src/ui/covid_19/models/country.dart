class CountryModel {
  final String country;
  final int cases;
  final int todayCases;
  final int casesPerOneMillion;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;

  CountryModel(
      {required this.country,
      required this.cases,
      required this.todayCases,
      required this.casesPerOneMillion,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active});

  // static CountryModel fromJson(Map<String, dynamic> json) => CountryModel(
  //       country: json["country"],
  //     );
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      country: json["country"],
      cases: json["cases"],
      todayCases: json["todayCases"],
      casesPerOneMillion: json["casesPerOneMillion"],
      deaths: json["deaths"],
      todayDeaths: json["todayDeaths"],
      recovered: json["recovered"],
      todayRecovered: json["todayRecovered"],
      active: json["active"],
    );
  }
}

// class CountryModel {
//   String? country;
//   int? cases;
//   int? todayCases;
//   int? deaths;
//   int? todayDeaths;
//   int? recovered;
//   int? todayRecovered;
//   int? active;

//   CountryModel(
//       {this.country,
//       this.cases,
//       this.todayCases,
//       this.deaths,
//       this.todayDeaths,
//       this.recovered,
//       this.todayRecovered,
//       this.active});

//   CountryModel.fromJson(Map<String, dynamic> json) {
//     this.country = json["country"];
//     this.cases = json["cases"];
//     this.todayCases = json["todayCases"];
//     this.deaths = json["deaths"];
//     this.todayDeaths = json["todayDeaths"];
//     this.recovered = json["recovered"];
//     this.todayRecovered = json["todayRecovered"];
//     this.active = json["active"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["country"] = this.country;
//     data["cases"] = this.cases;
//     data["todayCases"] = this.todayCases;
//     data["deaths"] = this.deaths;
//     data["todayDeaths"] = this.todayDeaths;
//     data["recovered"] = this.recovered;
//     data["todayRecovered"] = this.todayRecovered;
//     data["active"] = this.active;
//     return data;
//   }
// }
