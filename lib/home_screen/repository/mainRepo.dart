import 'package:covid_19_app/home_screen/models/covid_all_model.dart';
import 'package:covid_19_app/home_screen/models/covid_country_model.dart';
import 'package:covid_19_app/home_screen/provider/apiProvider.dart';

class Repository {
  final covidRemoteDataSource = CovidRemoteDataSource();

  Future<CovidAllModel> getAllCovidInfo() => covidRemoteDataSource.getAllCovidInfo();

  Future<CovidCountryModel> getCountrySpecifiCovidInfo(String country) => covidRemoteDataSource.getCountrySpecifiCovidInfo(country);

  Future<CovidCountryModel> getLKSpecifiCovidInfo() => covidRemoteDataSource.getCountrySpecifiCovidInfo('Sri Lanka');


}