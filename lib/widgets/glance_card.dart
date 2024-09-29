// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GlanceCard extends StatelessWidget {
  final String mainText;
  final String caption;
  final List<Color> gradientColors;
  final int scaleFactor;
  const GlanceCard(this.mainText, this.caption, this.gradientColors, this.scaleFactor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
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
            height: 12.0,
          ),
          Text(
            this.mainText,
            style: TextStyle(
              fontFamily: 'GSans',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 48.0 / (scaleFactor),
            ),
          ),
          SizedBox(
            height: 18.0 / scaleFactor,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                this.caption,
                style: TextStyle(
                  fontFamily: "GSans",
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0 / (scaleFactor),
                ),
              )),
        ],
      ),
    );
  }
}
