import 'package:flutter/material.dart';
import 'package:expensetracker/globals.dart' as globals;
import 'package:expensetracker/views/BottomNavBar.dart';

class transactionHistory extends StatefulWidget {
  const transactionHistory({super.key});

  @override
  State<transactionHistory> createState() => _transactionHistoryState();
}

class _transactionHistoryState extends State<transactionHistory> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent transactions",
          style: TextStyle(
            fontFamily: "GSans",
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: globals.userAccount.generateHistory(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
