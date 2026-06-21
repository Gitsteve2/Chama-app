import 'package:chama/features/transact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'features/banner_categories.dart';

class AccountsPage extends StatefulWidget {
  // const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage>
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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/grey_bg.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
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
                                      fontSize: 21,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Accounts',
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 7, left: 16, right: 16, bottom: 1),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 18,
                                  top: 5,
                                  bottom: hideBalance ? 9 : 4,
                                ),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('My accounts',
                                        style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          hideBalance = !hideBalance;
                                          if (hideBalance) {
                                            _animationController.reverse();
                                          } else {
                                            _animationController.forward();
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                              hideBalance
                                                  ? 'Show balance'
                                                  : 'Hide balance',
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  color: Color(0xFFd21312),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: hideBalance ? 5 : 2),
                                            child: SvgPicture.asset(
                                              hideBalance
                                                  ? "assets/images/show.svg"
                                                  : "assets/images/hide.svg",
                                              fit: BoxFit.cover,
                                              color: Color(0xFFa52b29),
                                              width: 40,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (!hideBalance) ...[
                                AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return SlideTransition(
                                      position: _slideAnimation,
                                      child: child,
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: List.generate(
                                            150 ~/ 1.8,
                                            (index) => Expanded(
                                                  child: Container(
                                                    color: index % 2 == 0
                                                        ? Colors.transparent
                                                        : Colors.grey.shade300,
                                                    height: 1,
                                                  ),
                                                )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, right: 16, bottom: 7),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Text('KES',
                                                    style: GoogleFonts.notoSans(
                                                      textStyle: TextStyle(
                                                        color:
                                                            Color(0xFFa52b29),
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  size: 34,
                                                  weight: 10,
                                                  color: Colors.grey.shade400,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, right: 16, bottom: 12),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('You have',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          textStyle: TextStyle(
                                                            color: Colors
                                                                .grey.shade600,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_upward,
                                                          size: 18,
                                                          weight: 900,
                                                          color:
                                                              Color(0xFFa52b29),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text('50,000.00',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('You owe',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          textStyle: TextStyle(
                                                            color: Colors
                                                                .grey.shade600,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 45.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .arrow_downward,
                                                            size: 18,
                                                            weight: 900,
                                                            color: Color(
                                                                0xFFa52b29),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text('-3,500.00',
                                                              style: GoogleFonts
                                                                  .openSans(
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My accounts',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      itemCount: accountText.length,
                      physics: BouncingScrollPhysics(),
                      controller:
                          PageController(initialPage: 0, viewportFraction: 0.9),
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 5,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.19,
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.025,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.028,
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.058,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.058,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/red_bg.png",
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.64,
                                                child: Text(accountText[index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Icon(
                                                  Icons.more_horiz,
                                                  size: 25,
                                                  color: Color(0xFFa52b29),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(accountAmount[index],
                                              style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                          Spacer(),
                                          Text(accountNumber[index],
                                              style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.5,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 2.0, top: 3),
                    margin: const EdgeInsets.only(
                      bottom: 20.0,
                      left: 17,
                      right: 17,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade200,
                          ),
                          child: Center(
                            child: Icon(Icons.add,
                                color: Color(0xFFa52b29), size: 35),
                          ),
                        ),
                      ),
                      title: Text(
                        'Add Existing',
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
                            'A bank account, card, mobile wallet\nor PayPal account',
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
