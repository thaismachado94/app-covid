import 'package:app_covid/core/constants/const.dart';
import 'package:app_covid/core/models/covid_cidades.dart';
import 'package:app_covid/ui/widgets/info_covid_cidades.dart';
import 'package:app_covid/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import '../../core/services/api_covid.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../core/models/listCidades.dart';

ApiCovidBrasil apiCovidBrasil = ApiCovidBrasil();

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController _typeAHeadController = TextEditingController();
  Future<List<ListCidadesModel>> listCidades;
  Future<List<CovidCidadeModel>> covidCidades;

  @override
  void initState() {
    super.initState();
    listCidades = apiCovidBrasil.getListCidades();
    covidCidades = apiCovidBrasil.getCidades("mairinque");

    this._typeAHeadController.text = "MAIRINQUE";
    Vibration.vibrate(duration: 1000);
  }

  List<String> _cidades(List<ListCidadesModel> list, String source) {
    List<String> matches = List();

    for (var item in list) {
      matches.add(item.cidade);
    }
    matches.retainWhere(
        (element) => element.toLowerCase().contains(source.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: listCidades,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(
                "Error !!!",
                style: TextStyle(fontSize: 50),
              ),
            );
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text("Loading"),
              );
            default:
              return !snapshot.hasData
                  ? Center(
                      child: Text(
                        "Empty",
                        style: TextStyle(fontSize: 50),
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Text(
                            "CONSULTAR CASOS NAS CIDADES",
                            style: TextStyle(
                              color: mySecondColortxt,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _typeAHeadController,
                            decoration: InputDecoration(
                              hintText: "Buscar cidade",
                              hintStyle: TextStyle(
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color: mySecondColorbk,
                                ),
                              ),
                              filled: true,
                              fillColor: myColorGeneric,
                              contentPadding: EdgeInsets.all(20),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 24, right: 16),
                                child: Icon(
                                  Icons.search,
                                  color: mySecondColortxt,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return _cidades(snapshot.data, pattern);
                          },
                          itemBuilder: (context, source) {
                            return ListTile(
                              title: Text(source),
                            );
                          },
                          transitionBuilder: (context, sourceBox, controller) {
                            return sourceBox;
                          },
                          onSuggestionSelected: (source) {
                            this._typeAHeadController.text = source;
                            setState(() {
                              covidCidades = apiCovidBrasil.getCidades(snapshot
                                  .data
                                  .firstWhere(
                                      (element) => element.cidade == source)
                                  .cidade);
                              Vibration.vibrate(duration: 1000);
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                          future: covidCidades,
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                child: Text("ERRO"),
                              );
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Center(
                                  child: Loading(),
                                );
                              default:
                                return !snapshot.hasData
                                    ? Center(
                                        child: Text("EMPTY"),
                                      )
                                    : InfoCovidCidades(
                                        covidCidades: snapshot.data,
                                      );
                            }
                          },
                        )
                      ],
                    );
          }
        });
  }
}
