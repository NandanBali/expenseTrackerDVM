import 'package:expenses/models/account.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/glance_card.dart';
import 'package:provider/provider.dart';
import 'package:expenses/globals.dart' as globals;

class QuickDetails extends StatefulWidget {
  @override
  State<QuickDetails> createState() => _QuickDetailsState();
}

class _QuickDetailsState extends State<QuickDetails> {
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

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return Consumer(
      builder: (context, value, child) => Stack(
      children: <Widget>[Container(
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
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            GlanceCard(
                "₹${(account.acc_month_ex).toString()}",
                "Expenses this ${thisMonth()}",
                <Color>[Colors.pink, Colors.red],
                1),
            SizedBox(
              height: 8.0,
            ),
            GlanceCard(
                "₹${account.acc_month_in.toString()}",
                "Income this ${thisMonth()}",
                <Color>[Colors.lime, Colors.green],
                1),
            SizedBox(
              height: 8.0,
            ),
            GlanceCard("₹${account.acc_balance.toString()}", "Net Balance",
                <Color>[Colors.lightBlue, Colors.indigo], 1),
          ],
        ),
      ),
      ],
    )
    );
  }
}
