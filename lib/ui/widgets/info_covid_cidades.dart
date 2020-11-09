import 'package:flutter/material.dart';
import 'package:app_covid/core/models/covid_cidades.dart';
import 'package:app_covid/core/constants/const.dart';

class InfoCovidCidades extends StatelessWidget {
  final List<CovidCidadeModel> covidCidades;
  InfoCovidCidades({@required this.covidCidades});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(
        children: <Widget>[
          Divider(
            height: 50,
          ),
          Flexible(
            child: Row(
              children: [
                buildCard(
                    "CASOS ATIVOS",
                    covidCidades[covidCidades.length - 1].ativos,
                    myPrimaryColorbk),
                buildCard(
                    "CONFIRMADOS",
                    covidCidades[covidCidades.length - 1].confirmados,
                    myPrimaryColorbk),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: Row(
              children: [
                buildCard(
                    "RECUPERADOS",
                    covidCidades[covidCidades.length - 1].recuperados,
                    myPrimaryColorbk),
                buildCard(
                    "MORTES",
                    covidCidades[covidCidades.length - 1].mortes,
                    myPrimaryColorbk),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String cases, Color color) {
    return Card(
      color: myPrimaryColortxt,
      child: Row(
        children: <Widget>[
          Container(
            width: 165,
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: mySecondColorbk,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cases.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
