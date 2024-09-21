import 'package:expensetracker/models/Payment.dart';
import 'package:expensetracker/views/CustomCards2.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class Account {
  List<Payment> acctHistory;
  double balance;
  String dbPath;
  Account(this.acctHistory, this.balance, this.dbPath) {
    acctHistory = [];
    balance = 0;
  }

  void insertPaymenttoDB(Payment p) async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'master_db.db'),
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE EXPENSES(id INTEGER PRIMARY KEY, amount REAL NOT NULL, datetime TEXT NOT NULL, type INT NOT NULL, category TEXT NOT NULL, description TEXT)');
      },
      version: 1,
    );
    final db = await database;
    await db.insert('EXPENSES', p.toMap(this.acctHistory.length + 1));
  }

  void readPaymentsfromDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'master_db.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE EXPENSES(id INTEGER PRIMARY KEY, amount REAL NOT NULL, datetime TEXT NOT NULL, type INT NOT NULL, category TEXT NOT NULL, description TEXT)');
      },
    );
    final db = await database;
    final List<Map<String, Object?>> paymentMaps = await db.query('EXPENSES');

    for (int i = 0; i < paymentMaps.length; i++) {
      Map<String, Object?> pMap = paymentMaps.elementAt(i);
      this.acctHistory.add(Payment(
          pMap['amount'] as double,
          pMap['category'] as String,
          DateTime.parse(pMap['datetime'] as String),
          pMap['description'] as String));
    }
  }

  void AddPayment(Payment tx) {
    this.acctHistory.add(tx);
    this.balance += tx.getTxAmount();
  }

  double getBalance() {
    return balance;
  }

  double getMonthlyExpense() {
    double monthEx = 0.0;
    if (this.acctHistory.length > 0) {
      List<Payment> monthTx =
          this.acctHistory.where((i) => (i.txCheck() && i.txExpense())).toList();
      for (int i = 0; i < monthTx.length; i++) {
        monthEx -= monthTx.elementAt(i).getTxAmount();
      }
    }
    return monthEx;
  }

  List<Widget> generateHistory() {
    List<Widget> historyList = [];
    for (int i = 0; i < this.acctHistory.length; i++) {
      Payment p = this.acctHistory.elementAt(i);
      historyList.add(HistoryCard(p));
      historyList.add(
        SizedBox(height: 10.0),
      );
    }
    historyList.add(OutlinedButton(onPressed: () {
      setState(){}
    }, child: Text('Refresh')));
    return historyList;
  }
}
