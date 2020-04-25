import 'base_model.dart';

class CovidAllModel extends BaseModel {
  int _updated;
  int _cases;
  int _todayCases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _active;
  int _critical;
  int _casesPerOneMillion;
  int _deathsPerOneMillion;
  int _tests;
  double _testsPerOneMillion;
  int _affectedCountries;

  CovidAllModel(
      {int updated,
        int cases,
        int todayCases,
        int deaths,
        int todayDeaths,
        int recovered,
        int active,
        int critical,
        int casesPerOneMillion,
        int deathsPerOneMillion,
        int tests,
//        double testsPerOneMillion,
        int affectedCountries}) {
    this._updated = updated;
    this._cases = cases;
    this._todayCases = todayCases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
    this._deathsPerOneMillion = deathsPerOneMillion;
    this._tests = tests;
//    this._testsPerOneMillion = testsPerOneMillion;
    this._affectedCountries = affectedCountries;
  }

  int get updated => _updated;
  set updated(int updated) => _updated = updated;
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
  int get deathsPerOneMillion => _deathsPerOneMillion;
  set deathsPerOneMillion(int deathsPerOneMillion) =>
      _deathsPerOneMillion = deathsPerOneMillion;
  int get tests => _tests;
  set tests(int tests) => _tests = tests;
//  double get testsPerOneMillion => _testsPerOneMillion;
//  set testsPerOneMillion(double testsPerOneMillion) =>
//      _testsPerOneMillion = testsPerOneMillion;
  int get affectedCountries => _affectedCountries;
  set affectedCountries(int affectedCountries) =>
      _affectedCountries = affectedCountries;

  CovidAllModel.fromJson(Map<String, dynamic> json) {
    _updated = json['updated'];
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _active = json['active'];
    _critical = json['critical'];
    _casesPerOneMillion = json['casesPerOneMillion'];
    _deathsPerOneMillion = json['deathsPerOneMillion'];
    _tests = json['tests'];
//    _testsPerOneMillion = json['testsPerOneMillion'];
    _affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this._updated;
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['casesPerOneMillion'] = this._casesPerOneMillion;
    data['deathsPerOneMillion'] = this._deathsPerOneMillion;
    data['tests'] = this._tests;
//    data['testsPerOneMillion'] = this._testsPerOneMillion;
    data['affectedCountries'] = this._affectedCountries;
    return data;
  }
}
