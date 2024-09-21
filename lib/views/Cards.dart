// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String mainText;
  final String caption;
  final List<Color> gradientColors;
  CustomCard(this.mainText, this.caption, this.gradientColors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: this.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 24.0,
          ),
          Text(
            this.mainText,
            style: TextStyle(
              fontFamily: 'GSans',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 64.0,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                this.caption,
                style: TextStyle(
                  fontFamily: "GSans",
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                ),
              )),
        ],
      ),
    );
  }
}
