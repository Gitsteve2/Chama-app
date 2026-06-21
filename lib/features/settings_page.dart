import 'package:chama/features/get_in_touch_page.dart';
import 'package:chama/features/transact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'features/banner_categories.dart';

class SettingsPage extends StatefulWidget {
  // const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  List<String> text1 = ['Send to', 'Buy', 'Send to', 'Pay', 'Money'];
  List<String> text2 = ['Equity', 'Airtime', 'Mobile', 'Bills', 'Money'];

  List<String> accountText = [
    'Dishon Polycap',
    // 'John Doe', 'David Mwangi'
  ];
  List<String> accountAmount = [
    '35,500.00 KES',
    // '50,500.00 KES',
    // '12,500.00 KES',
  ];

  List<String> accountNumber = [
    '05410123779424 • Savings',
    // '05410123779424 • Savings',
    // '05410123779424 • Savings',
  ];
  int currentindex = 0;
  bool hideBalance = true;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isMorning = now.hour < 12;

    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage(
      //         "assets/images/grey_bg.png",
      //       ),
      //       fit: BoxFit.cover),
      // ),
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: ListView(
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15.0, top: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                            height: 47,
                            width: 47,
                            padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Color(0xFFa52b29), width: 2)),
                            child: Center(
                              child: Text('DP',
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFFa52b29),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width *
                                      0.058),
                              child: Text('Settings and more',
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 4.0, top: 8),
                    margin: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1)),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          height: 47,
                          width: 47,
                          padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Color(0xFFa52b29), width: 2)),
                          child: Center(
                            child: Text('DP',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Color(0xFFa52b29),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ),
                        ),
                      ),
                      title: Text(
                        'Dishon Polycap',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            'dishon@gmail.com',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: 12.5,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '05410123779424',
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
                      onTap: () {},
                      tileColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 17.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(10),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/bell.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          width: 30,
                        ),
                      ),
                      title: Text(
                        'Notifications',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            'View and manage your\nnotifications',
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
                    padding: const EdgeInsets.only(bottom: 13.0, top: 13),
                    margin: const EdgeInsets.only(
                      bottom: 17.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(10),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/language.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          width: 30,
                        ),
                      ),
                      title: Text(
                        'Change language',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Support',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 17.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(10),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/active_chat.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          width: 30,
                        ),
                      ),
                      title: Text(
                        'Activate Chat Banking',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "Transact and more with Equity's\nvirtual assistant",
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
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 17.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/chat.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          width: 30,
                        ),
                      ),
                      title: Text(
                        'Get in touch',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "Email, call or find us on social\nmedia",
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
                      onTap: () {
                         Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GetInTouchPage()));
                      },
                      tileColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 17.0,
                      left: 17,
                      right: 17,
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
                          "assets/images/question2.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          // width: 15,
                        ),
                      ),
                      title: Text(
                        'Guides and tours',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "What do you want to learn\ntoday?",
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Security',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 17.0,
                      left: 17,
                      right: 17,
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
                          "assets/images/shield.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          // width: 30,
                        ),
                      ),
                      title: Text(
                        'Security',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "Manage password, biometrics\nand security questions",
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About Us',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 50.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(10),
                        height: 47,
                        width: 47,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/recommend.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          width: 30,
                        ),
                      ),
                      title: Text(
                        'Recommend',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "Recommend Equity mobile to a\nfriend",
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
                ]),
          )),
    );
  }
}
