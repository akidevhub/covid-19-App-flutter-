import 'package:covid_19_app/home_screen/models/base_model.dart';

class CovidCountryModel extends BaseModel {
  String _country;
  int _cases;
  int _todayCases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _active;
  int _critical;
  int _casesPerOneMillion;

  CovidCountryModel(
      {String country,
        int cases,
        int todayCases,
        int deaths,
        int todayDeaths,
        int recovered,
        int active,
        int critical,
        int casesPerOneMillion}) {
    this._country = country;
    this._cases = cases;
    this._todayCases = todayCases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
  }

  String get country => _country;
  set country(String country) => _country = country;
  int get cases => _cases;
  set cases(int cases) => _cases = cases;
  int get todayCases => _todayCases;
  set todayCases(int todayCases) => _todayCases = todayCases;
  int get deaths => _deaths;
  set deaths(int deaths) => _deaths = deaths;
  int get todayDeaths => _todayDeaths;
  set todayDeaths(int todayDeaths) => _todayDeaths = todayDeaths;
  int get recovered => _recovered;
  set recovered(int recovered) => _recovered = recovered;
  int get active => _active;
  set active(int active) => _active = active;
  int get critical => _critical;
  set critical(int critical) => _critical = critical;
  int get casesPerOneMillion => _casesPerOneMillion;
  set casesPerOneMillion(int casesPerOneMillion) =>
      _casesPerOneMillion = casesPerOneMillion;

  CovidCountryModel.fromJson(Map<String, dynamic> json) {
    _country = json['country'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this._country;
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['casesPerOneMillion'] = this._casesPerOneMillion;
    return data;
  }
}