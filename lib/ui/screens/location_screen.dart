import 'package:app_covid/core/constants/const.dart';
import 'package:app_covid/ui/widgets/info_covid_local.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../../core/services/api_covid.dart';
import '../../core/models/covid_local.dart';
import '../widgets/loading.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

ApiCovidBrasil apiCovidBrasil = ApiCovidBrasil();

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<List<CovidLocalModel>> resultLocal;

  getLocalizacao() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    getLocalizacao();
    resultLocal = apiCovidBrasil.getCovidLocal();
    Vibration.vibrate(duration: 1000);
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
                "Covid Local",
                style: TextStyle(
                  color: myColorGeneric,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    resultLocal = apiCovidBrasil.getCovidLocal();
                    getLocalizacao();
                    Vibration.vibrate(duration: 1000);
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
          future: resultLocal,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("Erro para buscar os dados"),
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
                    : InfoCovidLocal(
                        resultLocal: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}
