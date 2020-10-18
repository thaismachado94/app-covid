import 'package:app_covid/core/models/covid_brasil.dart';
import 'package:app_covid/core/models/covid_estados.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCovidBrasil {
  Future<CovidBrasilModel> getCovidBRasil() async {
    final data = await http.Client()
        .get("https://covid19-brazil-api.now.sh/api/report/v1/brazil");
    // if (data.statusCode != 200) throw Excepetion();:

    CovidBrasilModel resultBrasil =
        CovidBrasilModel.fromJson(json.decode(data.body));
    return resultBrasil;
  }

  Future<List<CovidEstadoModel>> getCovidEstados() async {
    final data = await http.Client()
        .get("https://covid19-brazil-api.now.sh/api/report/v1/brazil/uf/");

    List<CovidEstadoModel> resultCovidEstado = (json.decode(data.body) as List)
        .map((item) => new CovidEstadoModel.fromJson(item))
        .toList();

    return resultCovidEstado;
  }
}
