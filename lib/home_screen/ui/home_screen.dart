import 'package:covid_19_app/home_screen/bloc/allDetailsBloc.dart';
import 'package:covid_19_app/home_screen/models/covid_all_model.dart';
import 'package:covid_19_app/splash_screen/pages/ConnectionStatusBar.dart';
import 'package:covid_19_app/utils/Animation/FadeAnimation.dart';
import 'package:covid_19_app/utils/CustomTextStyle.dart';
import 'package:covid_19_app/utils/CustomUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gscarousel/gscarousel.dart';

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
    children: [
      CircularProgressIndicator(
        backgroundColor: Colors.redAccent,
      )
    ],
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
  return Scaffold(
    body: Builder(
      builder: (context) {
        var height = MediaQuery.of(context).size.height;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConnectionStatusBar(),
                  ),
//                  Container(
//                    color: Colors.white,
//                    height: height / 4,
//                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, right: 24, left: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    ),
                  ),
//                  Container(
//                    height: height / 4,
//                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 16, top: 30),
                      child: Text(
                        "C O V I D 19",
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  /*Slider Section*/
                  Container(
                    height: (height / 4) + 75,
                    alignment: Alignment.bottomCenter,
//                        child: Container(
//                          height: height / 4,
//                          child: PageView.builder(
//                            itemBuilder: (context, position) {
//                              return createSlider(listImage[position]);
//                            },
//                            controller: PageController(viewportFraction: 1),
//                            itemCount: listImage.length,
//                            onPageChanged: (position) {
//                              setState(() {
//                                selectedSliderPosition = position;
//                              });
//                            },
//                          ),
//                        )
                    child: Container(
                      child: SizedBox(
                        height: 180.0,
                        child: new GSCarousel(
                          autoPlayDuration: const Duration(seconds: 8),
                          images: [
                            new NetworkImage(
                                'https://macaunews.mo/wp-content/uploads/2020/02/d62bd7d19f90453d83427b3b6cf05b84.jpg'),
                            new NetworkImage(
                                'https://www.cota.org.au/information/covid19/launch-of-the-coronavirus-covid-19-campaign/'),
                            new NetworkImage(
                                'https://cdn-images.kontinentalist.com/singapore-coronavirus-cases-spread-connections/singapore-coronavirus-cases-spread-connections-1582375551.png'),
                            new NetworkImage(
                              'https://cdn.i.haymarketmedia.asia/?n=campaign-asia%2Fcontent%2Fcorona_shutterstock_1625183431_1200x800.png',
                            ),
                          ],
                          indicatorSize: const Size.square(10.0),
                          indicatorActiveSize: const Size(20.0, 10.0),
                          indicatorColor: Colors.white,
                          indicatorActiveColor: Colors.redAccent,
                          animationCurve: Curves.easeInCirc,
                          contentMode: BoxFit.cover,
                          // indicatorBackgroundColor: Colors.greenAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Utils.getSizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 20, bottom: 5),
                child: Text(
                  "World Covid 19 Epidemic Information",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      "Today Information",
                      style: CustomTextStyle.textFormFieldSemiBold
                          .copyWith(color: Color(0xff1D3F72)),
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                1.5,
                Container(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Today Death",style: TextStyle(
                                  fontSize: 25, color: Colors.white)),
                              Icon(FontAwesomeIcons.globeAmericas,color: Colors.white,)
//                              IconButton(
//                                icon: Icon(FontAwesomeIcons.userEdit),
//                                color: Colors.white,
//                                iconSize: 24,
////                                onPressed: () {
////                                  Navigator.push(
////                                      context,
////                                      new MaterialPageRoute(
////                                          builder: (context) =>
////                                              EditProfilePage()));
////                                },
//                              )
                            ],
                          ),
                        ),
                        Text(
                          death.todayDeaths.toString(),
                          style: CustomTextStyle.textFormFieldBlack.copyWith(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                1.5,
                Container(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Today Cases",style: TextStyle(
                                  fontSize: 25, color: Colors.white)),
                              Icon(FontAwesomeIcons.bed,color: Colors.white,)
//                              IconButton(
//                                icon: Icon(FontAwesomeIcons.userEdit),
//                                color: Colors.white,
//                                iconSize: 24,
////                                onPressed: () {
////                                  Navigator.push(
////                                      context,
////                                      new MaterialPageRoute(
////                                          builder: (context) =>
////                                              EditProfilePage()));
////                                },
//                              )
                            ],
                          ),
                        ),
                        Text(
                          death.deaths.toString(),
                          style: CustomTextStyle.textFormFieldBlack.copyWith(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                1.5,
                Container(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Affected Countries",style: TextStyle(
                                  fontSize: 18, color: Colors.grey)),
                              Text(death.affectedCountries.toString(),style: TextStyle(
                                  fontSize: 18, color: Colors.deepOrange)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Critical",style: TextStyle(
                                  fontSize: 18, color: Colors.grey)),
                              Text(death.critical.toString(),style: TextStyle(
                                  fontSize: 18, color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      "All Information",
                      style: CustomTextStyle.textFormFieldSemiBold
                          .copyWith(color: Color(0xff1D3F72)),
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                1.5,
                Container(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("All Death",style: TextStyle(
                                  fontSize: 25, color: Colors.white)),
                              Icon(FontAwesomeIcons.globeAmericas,color: Colors.white,)
//                              IconButton(
//                                icon: Icon(FontAwesomeIcons.userEdit),
//                                color: Colors.white,
//                                iconSize: 24,
////                                onPressed: () {
////                                  Navigator.push(
////                                      context,
////                                      new MaterialPageRoute(
////                                          builder: (context) =>
////                                              EditProfilePage()));
////                                },
//                              )
                            ],
                          ),
                        ),
                        Text(
                          death.deaths.toString(),
                          style: CustomTextStyle.textFormFieldBlack.copyWith(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                1.5,
                Container(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("All Cases",style: TextStyle(
                                  fontSize: 25, color: Colors.white)),
                              Icon(FontAwesomeIcons.bed,color: Colors.white,)
//                              IconButton(
//                                icon: Icon(FontAwesomeIcons.userEdit),
//                                color: Colors.white,
//                                iconSize: 24,
////                                onPressed: () {
////                                  Navigator.push(
////                                      context,
////                                      new MaterialPageRoute(
////                                          builder: (context) =>
////                                              EditProfilePage()));
////                                },
//                              )
                            ],
                          ),
                        ),
                        Text(
                          death.cases.toString(),
                          style: CustomTextStyle.textFormFieldBlack.copyWith(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                1.5,
                Container(
                  child: Card(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 15, right: 20, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Recovered",style: TextStyle(
                                  fontSize: 25, color: Colors.white)),
                              Icon(FontAwesomeIcons.heart,color: Colors.white,)
//                              IconButton(
//                                icon: Icon(FontAwesomeIcons.userEdit),
//                                color: Colors.white,
//                                iconSize: 24,
////                                onPressed: () {
////                                  Navigator.push(
////                                      context,
////                                      new MaterialPageRoute(
////                                          builder: (context) =>
////                                              EditProfilePage()));
////                                },
//                              )
                            ],
                          ),
                        ),
                        Text(
                          death.recovered.toString(),
                          style: CustomTextStyle.textFormFieldBlack.copyWith(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
