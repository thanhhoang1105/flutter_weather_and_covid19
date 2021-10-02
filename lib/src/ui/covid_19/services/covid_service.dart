import 'dart:convert';
import 'package:ggmap/src/ui/covid_19/models/country.dart';
import 'package:ggmap/src/ui/covid_19/models/global_summary.dart';
import 'package:http/http.dart' as http;

class CovidService {
  var data = [];
  List<CountryModel> results = [];

  String urlAll = "https://corona.lmao.ninja/v2/all";
  String urlCountry = "https://corona.lmao.ninja/v2/countries";

  Future<GlobalSummaryModel> getGlobalSummary() async {
    final response = await http.get(Uri.parse(urlAll));
    if (response.statusCode == 200) {
      var summary = GlobalSummaryModel.fromJson(jsonDecode(response.body));
      return summary;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  static Future<List<CountryModel>> getCountrySummary(String query) async {
    final response = await http.Client()
        .get(Uri.parse("https://corona.lmao.ninja/v2/countries"));
    if (response.statusCode == 200) {
      // print(response.body);
      final List summaryList = json.decode(response.body);

      return summaryList
          .map((json) => CountryModel.fromJson(json))
          .where((country) {
        final countryLower = country.country.toLowerCase();
        final queryLower = query.toLowerCase();
        return countryLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception('error');
    }
  }

  Future<List<CountryModel>> getCountryList() async {
    final response = await http.Client().get(Uri.parse(urlCountry));

    if (response.statusCode == 200) {
      List countries = json.decode(response.body);
      return countries.map((e) => CountryModel.fromJson(e)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
