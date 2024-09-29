// ignore_for_file: prefer_const_constructors
import 'package:expenses/widgets/at_a_glance.dart';
import 'package:expenses/widgets/history.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/floating_button.dart';
import 'package:provider/provider.dart';
import 'package:expenses/models/account.dart';
import 'package:expenses/globals.dart' as globals;

void main() {
  runApp(ChangeNotifierProvider<Account>(
    create: (_) => Account(),
    child: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.light;
  Icon themMode = Icon(Icons.dark_mode);
  void _toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
      if (_themeMode == ThemeMode.dark) {
        globals.color1 = Colors.black;
        globals.color2 = Colors.white;
        themMode = Icon(Icons.light_mode);
      } else {
        globals.color1 = Colors.white;
        globals.color2 = Colors.black;
        themMode = Icon(Icons.dark_mode);
      }
    });
  }

  // Toggle between light and dark mode
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Define light theme
      darkTheme: ThemeData.dark(), // Define dark theme
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Expense Tracker",
            style: TextStyle(
              fontFamily: "GSans",
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              _toggleTheme();
            },
            child: themMode,
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 72.0, top: 8.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                QuickDetails(),
                SizedBox(
                  height: 16.0,
                ),
                HistoryList(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingButtonTx(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
