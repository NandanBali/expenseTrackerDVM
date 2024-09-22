// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:expensetracker/models/Payment.dart';

class HistoryCard extends StatelessWidget {
  final Payment payment;
  List<Color> gradientColors = [];
  HistoryCard(this.payment, {super.key});

  @override
  Widget build(BuildContext context) {
    if (this.payment.txAmount > 0) {
      gradientColors = [Colors.lime, Colors.green];
    } else {
      gradientColors = [
        Color.fromARGB(255, 249, 98, 87),
        Color.fromARGB(255, 143, 10, 0)
      ];
    }
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
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  "₹${this.payment.txAmount.toString()}",
                  style: TextStyle(
                    fontFamily: 'GSans',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "On ${this.payment.txTime.day}/${this.payment.txTime.month}/${this.payment.txTime.year}",
                      style: TextStyle(
                        fontFamily: "GSans",
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                      ),
                    )),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Amount: ${this.payment.txAmount.toString()}",
                              style: TextStyle(
                                fontFamily: "GSans",
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Time: ${this.payment.txTime.hour}:${this.payment.txTime.minute} on ${this.payment.txTime.day}/${this.payment.txTime.month}/${this.payment.txTime.year}",
                              style: TextStyle(
                                fontFamily: "GSans",
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Description: ${this.payment.txDesc}",
                              style: TextStyle(
                                fontFamily: "GSans",
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Category: ${this.payment.category}",
                              style: TextStyle(
                                fontFamily: "GSans",
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.info_outline,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
