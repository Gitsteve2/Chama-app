import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'latest_transactions_widget.dart';
import 'money_in_widget.dart';
import 'money_out_widget.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isMoneyInScreen = true;
  bool isMoneyOutScreen = false;
  bool isRememberMe = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        AnimatedPositioned(
            duration: Duration(milliseconds: 0),
            child: AnimatedContainer(
                duration: Duration(milliseconds: 0),
                height: !isMoneyInScreen
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMoneyInScreen = true;
                                  isMoneyOutScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    decoration: BoxDecoration(
                                      color: isMoneyInScreen
                                          ? Color(0xFFa52b29)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "MONEY IN",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'poppins',
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          color: isMoneyInScreen
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMoneyInScreen = false;
                                  isMoneyOutScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    decoration: BoxDecoration(
                                      color: isMoneyOutScreen
                                          ? Color(0xFFa52b29)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "MONEY OUT",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'poppins',
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          color: isMoneyOutScreen
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isMoneyInScreen = false;
                                  isMoneyOutScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    decoration: BoxDecoration(
                                      color:
                                          !isMoneyInScreen && !isMoneyOutScreen
                                              ? Color(0xFFa52b29)
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "LATEST",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'poppins',
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          color: !isMoneyInScreen &&
                                                  !isMoneyOutScreen
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isMoneyInScreen && !isMoneyOutScreen)
                        LatestTransactionsWidget(),
                      if (isMoneyOutScreen) MoneyOutWidget(),
                      if (isMoneyInScreen) MoneyInWidget(),
                    ],
                  ),
                ))),
      ],
    ));
  }
}
