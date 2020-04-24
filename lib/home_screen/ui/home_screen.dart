import 'package:covid_19_app/home_screen/bloc/allDetailsBloc.dart';
import 'package:covid_19_app/home_screen/models/covid_all_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    AllCovidInfo.fetchAllCountryDetails();
    return StreamBuilder<CovidAllModel>(
      stream: AllCovidInfo.allCountryDetails,
      builder: (context, AsyncSnapshot<CovidAllModel> snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          return _buildCard(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget();
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }
}

Widget _buildLoadingWidget() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [CircularProgressIndicator(backgroundColor: Colors.redAccent,)],
  ));
}

Widget _buildErrorWidget() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text("Error occuer")],
  ));
}

Widget _buildCard(CovidAllModel death) {
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.album),
            title: Text("Deaths"),
            subtitle: Text(death.deaths.toString().toLowerCase()),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('BUY TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                child: const Text('LISTEN'),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
