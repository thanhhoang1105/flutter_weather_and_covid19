import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ggmap/src/ui/covid_19/models/country.dart';
// import 'package:ggmap/src/ui/covid_19/models/country_summary.dart';
import 'package:ggmap/src/ui/covid_19/screen/country_statistics.dart';
import 'package:ggmap/src/ui/covid_19/screen/global.dart';
import 'package:ggmap/src/ui/covid_19/services/covid_service.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final TextEditingController _typeAheadController = TextEditingController();
  Future<List<CountryModel>>? countryList;
  late Future<List<CountryModel>> summaryList;
  // Future<CountrySummaryModel>? countrySummaryList;

  @override
  initState() {
    super.initState();

    countryList = covidService.getCountryList();

    this._typeAheadController.text = "Vietnam";
    summaryList = covidService.getCountryList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Text("Loading"),
            );
          default:
            return !snapshot.hasData
                ? Center(
                    child: Text(
                      "Empty",
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        child: Text(
                          "Tên Quốc Gia",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TypeAheadFormField<CountryModel?>(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: this._typeAheadController,
                          decoration: InputDecoration(
                            hintText: 'Nhập tên quốc gia',
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.all(20),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 24.0, right: 16.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        suggestionsCallback: CovidService.getCountrySummary,
                        itemBuilder: (context, CountryModel? suggestion) {
                          final country = suggestion!;
                          return ListTile(
                            title: Text(country.country),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (CountryModel? suggestion) {
                          this._typeAheadController.text =
                              suggestion?.country ?? '';
                          setState(() {
                            summaryList = CovidService.getCountrySummary(
                                //snapshot.data!.firstWhere((e) => e.country == suggestion).query
                                suggestion!.country);
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      FutureBuilder<List<CountryModel>>(
                        future: summaryList,
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            return Center(
                              child: Text("Error"),
                            );
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(
                                child: Text("Loading"),
                              );
                            default:
                              return !snapshot.hasData
                                  ? Center(
                                      child: Text("Empty"),
                                    )
                                  : CountryStatistics(
                                      summaryList:
                                          snapshot.data as List<CountryModel>,
                                    );
                          }
                        },
                      ),
                    ],
                  );
        }
      },
    );
  }
}
