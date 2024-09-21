// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import '../models/Payment.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  late double amount;
  late String desc;
  late String category;
  String ddValue = "Credit";
  final List<String> list = <String>["Spend", "Income"];
  String typeofTx = "Credit/Debit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Transaction",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Amount box
                      SizedBox(
                        height: 40.0,
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
                            flex: 2,
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 82, 121, 184),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 80, 142, 193)),
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Border when enabled
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (value) {
                                amount = double.tryParse(value!) ?? 0.0;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a valid amount";
                                }
                                if (double.tryParse(value) == null) {
                                  return "Amount must be a number";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 8.0,),
                          Expanded(
                            flex: 1,
                            child: DropdownButton<String>(
                              style: TextStyle(
                                fontFamily: "GSans",
                              ),
                              hint: Text(
                                this.typeofTx,
                                style: TextStyle(fontFamily: "GSans"),
                              ),
                              items: <String>['Credit', 'Debit']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                String? selectedOption = newValue;
                                if (selectedOption == 'Debit') {
                                  this.ddValue = 'Debit';
                                  this.typeofTx = 'Debit';
                                  setState(() {
                                  });
                                } else {
                                  typeofTx = ddValue = 'Credit';
                                  setState(() {
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      // Type
                      SizedBox(
                        height: 20.0,
                      ),
                      // Description
                      SizedBox(
                        height: 20.0,
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
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 82, 121, 184),
                                width: 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 80, 142, 193)),
                            borderRadius: BorderRadius.circular(
                                10.0), // Border when enabled
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red,
                          )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          this.desc = value!;
                        },
                      ),
                      // Category
                      SizedBox(
                        height: 20.0,
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
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 82, 121, 184),
                                width: 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 80, 142, 193)),
                            borderRadius: BorderRadius.circular(
                                10.0), // Border when enabled
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.red,
                          )),
                        ),
                        onSaved: (value) {
                          category = value!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a category';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState?.save();
                                  // After validation and saving, you can use the values
                                  if (ddValue == "Debit") {
                                    amount *= -1;
                                  }
                                  Payment p = Payment(
                                      amount, category, DateTime.now(), desc);
                                  globals.userAccount.AddPayment(p);
                                  globals.userAccount.insertPaymenttoDB(p);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Added Transaction')),
                                  );
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
