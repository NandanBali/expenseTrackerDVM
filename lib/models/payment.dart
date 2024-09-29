import 'dart:convert';

import 'package:flutter/foundation.dart';

class Payment {
  late double txAmount;
  late String category;
  late DateTime txTime;
  late String txDesc;

  Payment(this.txAmount, this.category, this.txTime, this.txDesc);

    Payment.fromJson(Map<String, dynamic> jsonEntry)
      : txAmount = jsonEntry["Amount"],
        category = jsonEntry["Category"],
        txTime = DateTime.parse(jsonEntry["Category"]),
        txDesc = jsonEntry["Description"]
        ;

  Map<String, dynamic> toJson(){
    return {
      "Amount" : this.txAmount,
      "Category": this.category,
      "Description": this.txDesc,
      "Time": this.txTime.toString(),
    };
  }


  bool txCheck() {
    if (DateTime.now().month - txTime.month > 1) {
      return false;
    } else {
      return true;
    }
  }

  void setDescription(String desc) {
    txDesc = desc;
  }

  bool txExpense() {
    if(txAmount > 0) {
      return false;
    } else {
      return true;
    }
  }
  double getTxAmount() {
    return txAmount;
  }
}
