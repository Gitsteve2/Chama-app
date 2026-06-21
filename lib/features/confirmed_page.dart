import 'package:chama/features/navigation_menu.dart';
import 'package:chama/features/send_to_bank_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'send_money_page.dart';

class ConfirmedPage extends StatefulWidget {
  static String routeName = "/confirmed";

  @override
  State<ConfirmedPage> createState() => _ConfirmedPageState();
}

class _ConfirmedPageState extends State<ConfirmedPage> {
  int _selectedIndex = 0;
  String? _selectedRecipient;
  String? _amount;
  bool _isRecipientSelected = false;
  bool _isAmountValid = false;
  bool _showTransactionLimitError = false;
  bool _showMinimumAmountError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15.0, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => SendToBankPage()));
                    //   },
                    //   child: Container(
                    //     height: 47,
                    //     width: 47,
                    //     padding: EdgeInsets.only(right: 10, top: 2),
                    //     decoration: BoxDecoration(
                    //       color: Colors.transparent,
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     child: Center(
                    //       child: Icon(Icons.arrow_back_ios,
                    //           color: Colors.black, size: 20),
                    //     ),
                    //   ),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.37),
                          child: Text('Confirmed',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        )
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/confirm_img.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.23,
                      ),
                      Text('Great!',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text('Great! Your transaction was successful.',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  IconWithText(
                      imageAsset: "assets/images/down1.svg",
                      text: 'Download\nreceipt'),
                  SizedBox(width: 13.5),
                  IconWithText(
                      imageAsset: "assets/images/fav1.svg",
                      text: 'Add to\nfavourites'),
                  SizedBox(width: 13.5),
                  IconWithText(
                      imageAsset: "assets/images/scheduled1.svg",
                      text: 'Schedule\npayment'),
                  SizedBox(width: 13.5),
                  Spacer(),
                ],
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 20, left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sent amount',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Text('10.00 USD',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018),
                    Text('Sent to',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Text('Recipient Name',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018),
                    Text('Sent from',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Text('0470*********9261 • Savings',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Text('Available balance 195.74 KES',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018),
                    Text('Transaction reference',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Text('625082024140431',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018),
                    Text('Completed on',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Text('25-08-2024 14:04:31',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.083),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.095,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NavigationMenu()));
            },
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.095,
              padding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFa52b29),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: _isRecipientSelected && _isAmountValid
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NavigationMenu()));
                        }
                      : null,
                  child: Text(
                    'Done',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class IconWithText extends StatelessWidget {
  final String imageAsset;
  final String text;

  IconWithText({required this.imageAsset, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          width: 45,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFa52b29),
            borderRadius: BorderRadius.circular(30),
          ),
          child: SvgPicture.asset(
            imageAsset,
            fit: BoxFit.cover,
            color: Colors.white,
            width: 35,
          ),
        ),
        SizedBox(height: 2.0),
        Text(text,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
              ),
            )),
      ],
    );
  }
}
