import 'package:covid_19_app/home_screen/models/covid_all_model.dart';
import 'package:covid_19_app/home_screen/models/covid_country_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';


class SlDetailsBloc extends BaseBloc<CovidCountryModel> {

  Observable<CovidCountryModel> get slDetails => fetcher.stream;

  fetchAllCountryDetails() async {
    CovidCountryModel itemModel = await repository.getLKSpecifiCovidInfo();
    fetcher.sink.add(itemModel);
  }
}

final SlCovidInfo = SlDetailsBloc();