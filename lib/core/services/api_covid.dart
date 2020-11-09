import 'package:app_covid/core/models/covid_local.dart';
import 'package:app_covid/core/models/covid_cidades.dart';
import 'package:app_covid/core/models/listCidades.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* metodo de criação de dados da api */
class ApiCovidBrasil {
/* metodo de teste api*/
  Future<List<CovidLocalModel>> getCovidLocal() async {
    final data = await http.Client().get(
        "https://my-json-server.typicode.com/thaismachado94/api_covid_interior/mairinque");
    if (data.statusCode != 200) throw Exception();

    List<CovidLocalModel> resultLocal = (json.decode(data.body) as List)
        .map((item) => new CovidLocalModel.fromJson(item))
        .toList();
    return resultLocal;
  }

/* metodo para pegar os dados das cidades  */
  Future<List<CovidCidadeModel>> getCidades(String cidade) async {
    final data = await http.Client().get(
        "https://my-json-server.typicode.com/thaismachado94/api_covid_interior/" +
            cidade);
    if (data.statusCode != 200) throw Exception();

    List<CovidCidadeModel> covidCidades = (json.decode(data.body) as List)
        .map((item) => new CovidCidadeModel.fromJson(item))
        .toList();
    return covidCidades;
  }

/* metodo para listar as cidades no dropList */
  Future<List<ListCidadesModel>> getListCidades() async {
    final data = await http.Client().get(
        "https://my-json-server.typicode.com/thaismachado94/api_covid_interior/dropCidades");

    if (data.statusCode != 200) throw Exception();

    List<ListCidadesModel> listCidades = (json.decode(data.body) as List)
        .map((item) => new ListCidadesModel.fromJson(item))
        .toList();

    return listCidades;
  }
}
