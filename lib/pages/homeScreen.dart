// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:expensetracker/views/Cards.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/views/BottomNavBar.dart';
import '../globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("At a glance", style: TextStyle(fontFamily: "GSans"),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Heading
            SizedBox(
              width: double.infinity,
              height: 16.0,
            ),
            CustomCard("₹${globals.userAccount.getBalance()}", "Balance", [
              Colors.lightBlue,
              Colors.purple,
            ]),
            SizedBox(
              height: 20.0,
            ),
            CustomCard("₹${globals.userAccount.getMonthlyExpense()}",
                "Spent in ${thisMonth()}", [
              Colors.yellow,
              Colors.orange,
            ]),
            SizedBox(
              height: 20.0,
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  "Refresh",
                  style: TextStyle(fontFamily: "GSans"),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

String thisMonth() {
  String month = "";
  switch (DateTime.now().month) {
    case 1:
      month = "January";
      break;
    case 2:
      month = "February";
      break;
    case 3:
      month = "March";
      break;
    case 4:
      month = "April";
      break;
    case 5:
      month = "May";
      break;
    case 6:
      month = "June";
      break;
    case 7:
      month = "July";
      break;
    case 8:
      month = "August";
      break;
    case 9:
      month = "September";
      break;
    case 10:
      month = "October";
      break;
    case 11:
      month = "November";
      break;
    default:
      month = "December";
      break;
  }
  return month;
}
