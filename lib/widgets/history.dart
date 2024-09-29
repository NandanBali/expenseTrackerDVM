import 'package:flutter/material.dart';
import 'package:expenses/models/account.dart';
import 'package:provider/provider.dart';
import 'package:expenses/globals.dart' as globals;

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);

    return Consumer(
        builder: (context, value, child) => Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: globals.color2.withOpacity(0.2),
                          offset: Offset(6.0, 6.0),
                          blurRadius: 16.0,
                        ),
                      ],
                      color: globals.color1,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Recent Transactions",
                          style: TextStyle(
                              fontFamily: "GSans",
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 16.0,),
                      Column(
                        children: account.historyl,
                      ),
                    ])),
              ],
            ));
  }
}
