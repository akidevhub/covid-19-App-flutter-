import 'package:covid_19_app/home_screen/models/covid_all_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';


class AllCountryDetailsBloc extends BaseBloc<CovidAllModel> {

  Observable<CovidAllModel> get allCountryDetails => fetcher.stream;

  fetchAllCountryDetails() async {
    CovidAllModel itemModel = await repository.getAllCovidInfo();
    fetcher.sink.add(itemModel);
  }
}

final AllCovidInfo = AllCountryDetailsBloc();