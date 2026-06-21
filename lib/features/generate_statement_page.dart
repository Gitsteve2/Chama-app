import 'dart:math';

import 'package:chama/account_popup_widget.dart';
import 'package:flutter/material.dart';

class GenerateStatement extends StatefulWidget {
  @override
  _GenerateStatementState createState() => _GenerateStatementState();
}

class _GenerateStatementState extends State<GenerateStatement> {
  String code = "";
  final _productSizesList = ["All Transactions", "Option 2", "Option 3"];

  String _selectedVal = 'All Transactions';

  DateTime _dateTime = DateTime.now();

  void _selectDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 35,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 15,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'DS',
                        style: TextStyle(
                            fontFamily: 'paypal',
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "DAVID GAKOBO SUSAN ",
                              style: TextStyle(
                                  fontFamily: 'paypal',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SHORTCODE ",
                              style: TextStyle(
                                  fontFamily: 'paypal',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              " 12345678",
                              style: TextStyle(
                                fontFamily: 'paypal',
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFa52b29),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "PDF",
                      style: TextStyle(
                          fontFamily: 'paypal',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return AccountPopupWidget();
                                },
                              );
                            },
                            child: Text(
                              "TRANSACTION TYPE",
                              style: TextStyle(
                                  fontFamily: 'paypal',
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          DropdownButtonFormField(
                            value: _selectedVal,
                            items: _productSizesList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedVal = val as String;
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.all(0),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Text(
                            "START DATE",
                            style: TextStyle(
                                fontFamily: 'paypal',
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                                suffixIcon: Icon(Icons.calendar_today_outlined),
                                border: UnderlineInputBorder()),
                            readOnly: true,
                            onTap: _selectDate,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Text(
                            "END DATE",
                            style: TextStyle(
                                fontFamily: 'paypal',
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                                suffixIcon: Icon(Icons.calendar_today_outlined),
                                border: UnderlineInputBorder()),
                            readOnly: true,
                            onTap: _selectDate,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Date range can't be more than 6 months",
                              style: TextStyle(
                                  fontFamily: 'paypal',
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'GENERATE STATEMENT',
                                style: TextStyle(
                                    fontFamily: 'paypal',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue.shade700,
                                padding: EdgeInsets.symmetric(
                                    vertical: 17,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.2),
                                backgroundColor: Colors.blue.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 0,
                                shadowColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 48,
        height: 48,
        child: Container(
          decoration: BoxDecoration(
            // color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontFamily: 'paypal',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
