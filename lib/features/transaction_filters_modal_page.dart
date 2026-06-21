import 'package:chama/features/navigation_menu.dart';
import 'package:chama/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionFiltersModalPage extends StatefulWidget {
  static String routeName = "/transact";

  @override
  State<TransactionFiltersModalPage> createState() =>
      _TransactionFiltersModalPageState();
}

class _TransactionFiltersModalPageState
    extends State<TransactionFiltersModalPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(children: []),
      ),
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
                            builder: (context) => NavigationMenu()));
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
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Transact',
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
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.all(3),
                        height: 55,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: -5.0,
                                right: -5.0,
                                child: Center(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    height: 15,
                                    width: 21,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFa52b29),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text('9+',
                                          style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                right: 10.0,
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 47,
                                    width: 47,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/bell.svg",
                                      fit: BoxFit.cover,
                                      color: Color(0xFFa52b29),
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('What would you like to do?',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildToggleButton('All', 0),
                      _buildToggleButton('Send money', 1),
                      _buildToggleButton('Pay with Equity', 2),
                      _buildToggleButton('Buy', 3),
                      _buildToggleButton('Withdraw Cash', 4),
                      _buildToggleButton('Remittance', 5),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.025,
                  bottom: MediaQuery.of(context).size.height * 0.031,
                  left: MediaQuery.of(context).size.width * 0.058,
                  right: MediaQuery.of(context).size.width * 0.058,
                ),
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.042,
                  left: MediaQuery.of(context).size.width * 0.042,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade50,
                    border: Border.all(color: Colors.grey.shade200, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Favourites',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    SizedBox(height: 8),
                    Text(
                        'Your favorite contact will appear here. Add a new one to quickly transact.',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        )),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Spacer(),
                        Text('Add a favorite',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFFa52b29),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.grey.shade200,
              ),
              SizedBox(height: 17),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.024,
                  bottom: MediaQuery.of(context).size.height * 0.025,
                  left: MediaQuery.of(context).size.width * 0.012,
                  right: MediaQuery.of(context).size.width * 0.058,
                ),
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.042,
                  left: MediaQuery.of(context).size.width * 0.042,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrange.shade50,
                ),
                child: Row(
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/scheduled.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Schedule Payments',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Color(0xFFa52b29),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          SizedBox(height: 5),
                          Text('Manage recurring payments.',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.37,
                                decoration: BoxDecoration(
                                  color: Color(0xFFa52b29),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Manage here',
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
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
              SizedBox(height: 22),
              if (_selectedIndex != 0) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text("currentTitle",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: _selectedIndex == index
                    ? Color(0xFFa52b29)
                    : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(title,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: _selectedIndex == index
                      ? Color(0xFFa52b29)
                      : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildGridItem({required String icon, required String label}) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 125,
          padding: EdgeInsets.only(left: 3, right: 3, top: 16, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              SizedBox(height: 3),
              Text(label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
