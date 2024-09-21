// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../pages/transactionscreen.dart';
import '../pages/homeScreen.dart';
import 'package:expensetracker/pages/transactionHistory.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (value) {
        if (value == 0) {
          setState(() {
            index = 0;
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (value == 1) {
          // TODO: Implement popUntil
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TransactionForm()),
          );
        } else if (value == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => transactionHistory()),
          );
        } else {
          print("what ever happened?");
        }
      },
      destinations: <Widget>[
        NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home_filled),
            label: "Home"),
        NavigationDestination(icon: Icon(Icons.create), label: "New Tx."),
        NavigationDestination(icon: Icon(Icons.history), label: "History"),
      ],
    );
  }
}
