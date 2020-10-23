import 'package:app_covid/core/constants/const.dart';
import 'package:app_covid/ui/widgets/info_covid_brasil.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../../core/services/api_covid.dart';
import '../../core/models/covid_brasil.dart';
import '../widgets/loading.dart';

ApiCovidBrasil apiCovidBrasil = ApiCovidBrasil();

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<CovidBrasilModel> resultCovidBrasil;

  @override
  void initState() {
    super.initState();
    resultCovidBrasil = apiCovidBrasil.getCovidBRasil();
    Vibration.vibrate(duration: 500);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 100, left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Covid no Brasil",
                style: TextStyle(
                  color: myColorGeneric,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    resultCovidBrasil = apiCovidBrasil.getCovidBRasil();
                    Vibration.vibrate(duration: 500);
                  });
                },
                child: Icon(
                  Icons.refresh,
                  size: 50,
                  color: myColorGeneric,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: resultCovidBrasil,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("Error"),
              );
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Loading();
              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text(
                          "Empty",
                          style: TextStyle(color: mySecondColortxt),
                        ),
                      )
                    : InfoCovidBrasil(
                        resultBrasil: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}
