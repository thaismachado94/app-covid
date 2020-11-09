import 'package:flutter/material.dart';
import '../../core/constants/const.dart';
import '../../core/models/covid_local.dart';

class InfoCovidLocal extends StatelessWidget {
  final List<CovidLocalModel> resultLocal;
  InfoCovidLocal({@required this.resultLocal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: [
                buildCard(
                    "CASOS ATIVOS",
                    resultLocal[resultLocal.length - 1].ativos,
                    myPrimaryColorbk),
                buildCard(
                    "CONFIRMADOS",
                    resultLocal[resultLocal.length - 1].confirmados,
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
                    resultLocal[resultLocal.length - 1].recuperados,
                    myPrimaryColorbk),
                buildCard("MORTES", resultLocal[resultLocal.length - 1].mortes,
                    myPrimaryColorbk),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String casos, Color color) {
    return Card(
      elevation: 4,
      color: myPrimaryColortxt,
      child: Row(
        children: <Widget>[
          Container(
            width: 165,
            padding: EdgeInsets.only(top: 25),
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
                  casos.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
