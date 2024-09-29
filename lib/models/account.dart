import 'package:expenses/models/payment.dart';
import 'package:flutter/material.dart';
import 'package:expenses/widgets/recent_history.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Account extends ChangeNotifier {
  late List<Payment> acctHistory;
  double balance = 0.0;
  double monthlyExpense = 0.0;
  double monthlyIncome = 0.0;
  List<Widget> historyl = <Widget>[];
  List<String> categories = ["Shopping", "Money Transfer", "Food", "Travel", "Essentials", "Income"];
  Account() {
    acctHistory = [];
    refreshList();
  }
  Account.fromJson(Map<String, dynamic> json)
      : acctHistory = (json["AccountHistory"] as List)
            .map((i) => Payment.fromJson(i))
            .toList();

  // json
  Map<String, dynamic> toJson() {
    return {
      "Balance": this.balance,
      "Expense": this.monthlyExpense,
      "Income": this.monthlyIncome,
      "AccountHistory": acctHistory.map((payment) => payment.toJson()).toList()
    };
  }

  // getters
  double get acc_balance => this.balance;
  double get acc_month_ex => this.monthlyExpense;
  double get acc_month_in => this.monthlyIncome;
  List<Payment> get acc_history => this.acctHistory;

  // setters
  void calcMonthlyExpense() {
    this.monthlyExpense = 0;
    if (acctHistory.isNotEmpty) {
      List<Payment> monthTx =
          acctHistory.where((i) => (i.txCheck() && i.txExpense())).toList();
      for (int i = 0; i < monthTx.length; i++) {
        this.monthlyExpense -= monthTx.elementAt(i).getTxAmount();
      }
    }
    notifyListeners();
  }

  void calcMonthlyIncome() {
    this.monthlyIncome = 0;
    if (acctHistory.isNotEmpty) {
      List<Payment> monthTx =
          acctHistory.where((i) => (i.txCheck() && (!i.txExpense()))).toList();
      for (int i = 0; i < monthTx.length; i++) {
        this.monthlyIncome += monthTx.elementAt(i).getTxAmount();
      }
    }
    notifyListeners();
  }

  void AddPayment(Payment tx) {
    acctHistory.add(tx);
    savePaymentsToJson();
    balance += tx.getTxAmount();
    calcMonthlyExpense();
    calcMonthlyIncome();
    refreshList();
    notifyListeners();
  }

  // check
  bool checkBalance() {
    if (this.balance >= 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> savePaymentsToJson() async {
    try {
      final file = await _getLocalFile();
      String jsonString =
          jsonEncode(acctHistory.map((p) => p.toJson()).toList());
      await file.writeAsString(jsonString);
    } catch (e) {
      print("Error saving payments: $e");
    }
  }

  Future<void> loadPaymentsFromJson() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        String jsonString = await file.readAsString();
        List<dynamic> jsonData = jsonDecode(jsonString);
        acctHistory = jsonData.map((p) => Payment.fromJson(p)).toList();
        notifyListeners();
      }
    } catch (e) {
      print("Error loading payments: $e");
    }
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/payments.json');
  }

  void refreshList() {
    if (acctHistory.isEmpty) {
      this.historyl = <Widget>[
        Container(
          child: Text(
            "Recent transactions should appear here",
            style: TextStyle(
              fontFamily: "GSans",
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ];
    } else {
      this.historyl = generateHistory("All");
    }
  }

  // Database BS

  List<Widget> generateHistory(String transactionFilter) {
    List<Widget> historyList = [];
    late List<Payment> inputList;

    switch (transactionFilter) {
      case "All":
        inputList = this.acctHistory;
        break;
      case "Food":
        inputList =
            this.acctHistory.where((p) => (p.category == "Food")).toList();
        break;
      case "Money Transfer":
        inputList = this
            .acctHistory
            .where((p) => (p.category == "Money Transfer"))
            .toList();
        break;
      case "Supplies":
        inputList =
            this.acctHistory.where((p) => (p.category == "Supplies")).toList();
        break;
      case "Shopping":
        inputList =
            this.acctHistory.where((p) => (p.category == "Shopping")).toList();
        break;
      case "Miscellanous":
        inputList =
            this.acctHistory.where((p) => (p.category == "Shopping")).toList();
        break;
      default:
        inputList = this.acctHistory;
        break;
    }

    for (int i = 0; i < inputList.length; i++) {
      Payment p = inputList.elementAt(i);
      historyList.add(HistoryCard(p));
      historyList.add(
        const SizedBox(height: 10.0),
      );
    }
    return historyList;
  }
}
