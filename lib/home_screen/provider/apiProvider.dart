import 'dart:convert';

import 'package:covid_19_app/Error/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/covid_all_model.dart';
import '../models/covid_country_model.dart';


class CovidRemoteDataSource {
//  http.Client _httpClient;

//  CovidRemoteDataSource({@required http.Client httpClient}) {
//    this._httpClient = httpClient;
//  }

  Future<CovidAllModel> getAllCovidInfo() async {
    final response =
    await http.get('https://corona.lmao.ninja/v2/all');
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      print("Responce "+response.body);
      return CovidAllModel.fromJson(
        json.decode(response.body),
      );
    }
  }

  Future<CovidCountryModel> getCountrySpecifiCovidInfo(String country) async {
    final responseCovid = await http.get('https://corona.lmao.ninja/countries/$country');

    if ((responseCovid.statusCode != 200)) {
      throw ServerException();
    } else {
      try {
        return CovidCountryModel.fromJson(
            json.decode(responseCovid.body)
        );
      } on Exception {
        throw CountryNotFoundException();
      }
    }
  }
}
