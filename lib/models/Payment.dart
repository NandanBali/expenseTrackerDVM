class Payment {
  double txAmount;
  String category;
  DateTime txTime;
  String txDesc;

  Payment(this.txAmount, this.category, this.txTime, this.txDesc);

  bool txCheck() {
    if (DateTime.now().month - this.txTime.month > 1) {
      return false;
    } else {
      return true;
    }
  }

  bool txExpense() {
    if(txAmount > 0) {
      return false;
    } else {
      return true;
    }
  }
  double getTxAmount() {
    return this.txAmount;
  }

  Map<String, Object?> toMap(int id) {
    return {
      'id': id,
      'amount': this.txAmount,
      'datetime': this.txTime.toString(),
      'type': 1,
      'category': this.category,
      'description': this.txDesc,
    };
  }
}
