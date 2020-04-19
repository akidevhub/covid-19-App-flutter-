import 'package:data_connection_checker/data_connection_checker.dart';

class SplashScreenRepo{
  final DataConnectionChecker connectionChecker;

  SplashScreenRepo(this.connectionChecker);

//  SplashScreenRepo({@required NetworkInfo networkInfo}) {
//    this._networkInfo = networkInfo;
//  }

  Future<bool> navigateToMainScreen() async {
    await Future.delayed(
      Duration(seconds: 4),
    );
    if (await this.connectionChecker.hasConnection) {
      return true;
    } else {
      return false;
    }
  }
}