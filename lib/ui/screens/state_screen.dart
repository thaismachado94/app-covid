import 'package:app_covid/core/constants/const.dart';
import 'package:app_covid/core/models/testList.dart';
import 'package:flutter/material.dart';
import '../../core/services/api_covid.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../core/models/covid_estados.dart';
import '../../core/models/list_estados.dart';

ApiCovidBrasil apiCovidBrasil = ApiCovidBrasil();

class StateScreen extends StatefulWidget {
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  Future<List<CountryModel>> countries;
  // Future<List<ListEstadoModel>> listEstado;

  @override
  void initState() {
    super.initState();
    countries = apiCovidBrasil.getCountryList();
    // listEstado = apiCovidBrasil.getListEstado();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: countries,
        // future: listEstado,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text("Error !!!"),
            );
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text("Loading"),
              );
            default:
              return !snapshot.hasData
                  ? Center(
                      child: Text("Empty"),
                    )
                  : Center(
                      child: Text("DATA IS HERE!!"),
                    );
          }
        });
  }
}
