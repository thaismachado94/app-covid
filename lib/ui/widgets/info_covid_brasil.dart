import 'package:flutter/material.dart';
import '../../core/constants/const.dart';
import '../../core/models/covid_brasil.dart';

class InfoCovidBrasil extends StatelessWidget {
  final CovidBrasilModel resultBrasil;

  InfoCovidBrasil({@required this.resultBrasil});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: [
                buildCard("CASOS", resultBrasil.cases, myPrimaryColorbk),
                buildCard(
                    "CONFIRMADOS", resultBrasil.confirmed, myPrimaryColorbk),
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
                    "RECUPERADOS", resultBrasil.recovered, myPrimaryColorbk),
                buildCard("MORTES", resultBrasil.deaths, myPrimaryColorbk),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, int cases, Color color) {
    return Card(
      elevation: 4,
      color: myPrimaryColortxt,
      child: Row(
        children: <Widget>[
          Container(
            width: 165,
            padding: EdgeInsets.all(10),
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
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
