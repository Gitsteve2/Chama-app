import 'package:chama/features/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'transact_page.dart';

class GetInTouchPage extends StatefulWidget {
  static String routeName = "/get_in_touch";

  @override
  State<GetInTouchPage> createState() => _GetInTouchPageState();
}

class _GetInTouchPageState extends State<GetInTouchPage> {
  @override
  void initState() {
    super.initState();
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                      },
                      child: Container(
                        height: 47,
                        width: 47,
                        padding: EdgeInsets.only(right: 10, top: 2),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.black, size: 20),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.21),
                          child: Text('Get in touch',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('How can we help you?',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    'Reach out to us any time you need help and our\ntalented team will gladly assist you',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                margin: const EdgeInsets.only(
                  // bottom: 5.0,
                  // left: 17,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(11),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/phone1.svg",
                      fit: BoxFit.cover,
                      color: Color(0xFFa52b29),
                      width: 30,
                    ),
                  ),
                  title: Text(
                    'Call us',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        '+254 763 063000',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 3,
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Color(0xFFa52b29)),
                  ),
                  onTap: () {},
                  tileColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2, bottom: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(9),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/email1.svg",
                      fit: BoxFit.cover,
                      color: Color(0xFFa52b29),
                      width: 30,
                    ),
                  ),
                  title: Text(
                    'Email us',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        'info@equitybank.co.ke',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 3,
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Color(0xFFa52b29)),
                  ),
                  onTap: () {},
                  tileColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2, bottom: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(9),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/screen.svg",
                      fit: BoxFit.cover,
                      color: Color(0xFFa52b29),
                      width: 30,
                    ),
                  ),
                  title: Text(
                    'Visit our website',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        'https://equitygroupholdings.com/ke/',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 3,
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Color(0xFFa52b29)),
                  ),
                  onTap: () {},
                  tileColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2, bottom: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(9),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/twitter1.svg",
                      fit: BoxFit.cover,
                      width: 30,
                    ),
                  ),
                  title: Text(
                    'Follow us on Twitter',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        '@KeEquityBank',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 3,
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Color(0xFFa52b29)),
                  ),
                  onTap: () {},
                  tileColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2, bottom: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(12),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/fb1.svg",
                      fit: BoxFit.cover,
                      // color: Color(0xFFa52b29),
                      color: Colors.indigo.shade400,
                      width: 30,
                    ),
                  ),
                  title: Text(
                    'Like us on Facebook',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        'https://www.facebook.com\n/KeEquityBank/',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 3,
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Color(0xFFa52b29)),
                  ),
                  onTap: () {},
                  tileColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2, bottom: 7),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(12),
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/linkedin1.svg",
                      fit: BoxFit.cover,
                      // color: Color(0xFFa52b29),
                      width: 30,
                    ),
                  ),
                  title: Text(
                    'Follow us on LinkedIn',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text(
                        'Equity Bank Limited',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 3,
                    child: Icon(Icons.arrow_forward_ios,
                        size: 18, color: Color(0xFFa52b29)),
                  ),
                  onTap: () {},
                  tileColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
