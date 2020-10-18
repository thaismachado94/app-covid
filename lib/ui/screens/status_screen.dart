import 'package:app_covid/core/constants/const.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onSelected;

  OptionScreen(
      {@required this.title,
      @required this.selected,
      @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: selected ? myPrimaryColortxt : mySecondColortxt,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: myColorGeneric,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
