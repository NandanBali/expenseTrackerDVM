// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expenses/models/account.dart';
import 'package:expenses/models/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expenses/widgets/input_decoration.dart';
import 'package:expenses/globals.dart' as globals;

class FloatingButtonTx extends StatefulWidget {
  const FloatingButtonTx({super.key});

  @override
  State<FloatingButtonTx> createState() => _FloatingButtonTxState();
}

class _FloatingButtonTxState extends State<FloatingButtonTx> {
  final TextEditingController _controller1 = TextEditingController();
  final int amount = 0;
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerCategory = TextEditingController();

  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();

  String ddValue = "Credit";
  String typeofTx = "Credit/Debit";
  String catValue = "Miscellanous";
  String catofTx = "Miscellanous";
  // TODO: Implement the sliding down warning dialog box.
  final FocusNode _focusNodeDescription = FocusNode();

  void _dispose() {
    _controller1.dispose();
    _controllerDescription.dispose();
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    super.dispose(); // for surety
  }

  Payment _saveDetails(double multiplier) {
    //TODO: fix the description
    return Payment((multiplier * double.parse(_controller1.text)), catofTx,
        DateTime.now(), "");
  }

  void _moveFocus() {
    FocusScope.of(context).requestFocus(_focusNodeDescription);
  }

  void _showAlertDialog(BuildContext bctx) {
    showDialog(
        context: bctx,
        builder: (bctx) {
          return AlertDialog(
            title: Text("Confirm"),
            content: Text(
              "Do you want to cancel the payment?",
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(bctx);
                  },
                  child: Text("Yes"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<Account>(context);
    return FloatingActionButton.extended(
      label: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.add),
            SizedBox(width: 6.0),
            Text(
              "Add Payment",
              style: TextStyle(
                fontFamily: "GSans",
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            isDismissible: false,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                color: globals.color1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Add Transaction",
                      style: TextStyle(
                        fontFamily: "GSans",
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Amount",
                        style: TextStyle(
                          fontFamily: "GSans",
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: TextField(
                            focusNode: f1,
                            controller: _controller1,
                            decoration:
                                textFieldDecoration().mainInputDecoration(),
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(f2);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButton<String>(
                            focusNode: f2,
                            style: TextStyle(
                              fontFamily: "GSans",
                              color: globals.color2,
                            ),
                            items:
                                <String>['Credit', 'Debit'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              String? selectedOption = newValue;
                              if (selectedOption == 'Debit') {
                                ddValue = 'Debit';
                                typeofTx = 'Debit';
                                setState(() {});
                              } else {
                                typeofTx = ddValue = 'Credit';
                                setState(() {});
                              }
                            },
                            hint: Text(
                              this.typeofTx,
                              style: TextStyle(fontFamily: "GSans"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // TODO: Implement the drop down menu
                    // TODO: Implement proper sizing and design.
                    SizedBox(
                      width: double.infinity,
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontFamily: "GSans",
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextField(
                      focusNode: f3,
                      controller: _controllerDescription,
                      decoration: textFieldDecoration().mainInputDecoration(),
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(f4);
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontFamily: "GSans",
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            focusNode: f4,
                            style: TextStyle(
                              fontFamily: "GSans",
                              color: globals.color2,
                            ),
                            items: account.categories.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              String? selectedOption = newValue;
                              for (int i = 0;
                                  i < account.categories.length;
                                  i++) {
                                if (selectedOption == account.categories[i]) {
                                  catValue = catofTx = account.categories[i];
                                  setState(() {});
                                }
                              }
                            },
                            hint: Text(
                              this.catofTx,
                              style: TextStyle(fontFamily: "GSans"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 64.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              _showAlertDialog(context);
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.cancel),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text("Cancel Transaction")
                              ],
                            )),
                        ElevatedButton(
                          onPressed: () {
                            if (_controller1.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Missing details"),
                                      content: Text(
                                          "Please enter some amount of money"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    );
                                  });
                            }
                            Payment p = _saveDetails(1.0);
                            if (typeofTx == "Debit") {
                              p.txAmount = -1 * p.txAmount;
                            }
                            if (p.txAmount + account.acc_balance < 0) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Incorrect amount"),
                                      content: Text(
                                          "The withdrawn amount is more than the balance"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("OK"))
                                      ],
                                    );
                                  });
                            } else {
                              if (ddValue == "Debit") {
                                account.AddPayment(_saveDetails(-1.0));
                              } else {
                                account.AddPayment(_saveDetails(1.0));
                              }
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Added Transaction"),
                                backgroundColor: Colors.amber,
                              ));
                            }
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.check),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text("Submit")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
