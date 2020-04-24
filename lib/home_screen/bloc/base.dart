import 'package:covid_19_app/home_screen/models/base_model.dart';
import 'package:covid_19_app/home_screen/repository/mainRepo.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}