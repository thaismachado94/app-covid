import 'package:app_covid/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                loadingCard(),
                loadingCard(),
              ],
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            child: Row(
              children: <Widget>[
                loadingCard(),
                loadingCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget loadingCard() {
  return Card(
    color: myPrimaryColortxt,
    elevation: 1,
    child: Row(
      children: <Widget>[
        Container(
          width: 165,
          padding: EdgeInsets.all(20),
          child: Shimmer.fromColors(
            baseColor: mySecondColortxt,
            highlightColor: myColorGeneric,
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 40,
                  color: myPrimaryColortxt,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
