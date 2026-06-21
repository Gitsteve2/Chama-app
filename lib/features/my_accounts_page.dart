import 'package:chama/features/filter_statement_widget.dart';
import 'package:chama/features/view_statement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountsScreen extends StatefulWidget {
  @override
  _MyAccountsScreenState createState() => _MyAccountsScreenState();
}

class _MyAccountsScreenState extends State<MyAccountsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 20.0,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  bool scrolled = constraints.biggest.height <= 100;
                  return FlexibleSpaceBar(
                    background: Container(
                      // color: Colors.red.shade700,
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  );
                },
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Center(
                child: Text('My accounts', // The header title
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        // color: Color(0xFFa52b29),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {
                    // Handle more button press
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.22,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                        bottom: MediaQuery.of(context).size.height * 0.028,
                        left: MediaQuery.of(context).size.width * 0.058,
                        right: MediaQuery.of(context).size.width * 0.058,
                      ),
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                        bottom: MediaQuery.of(context).size.height * 0.028,
                        left: MediaQuery.of(context).size.width * 0.058,
                        right: MediaQuery.of(context).size.width * 0.058,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.64,
                                child: Text('Dishon Polycap',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text("Savings Account",
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Text('05410123779424',
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Balance section
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Text('Available balance',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('47.24 KES',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          SizedBox(width: 3.0),
                          Center(
                            child: Icon(Icons.keyboard_arrow_down,
                                color: Colors.black, size: 30),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.0),
                    // Icons section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        IconWithText(
                            imageAsset: "assets/images/transact.svg",
                            text: 'Transact'),
                        SizedBox(width: 13.5),
                        IconWithText(
                            imageAsset: "assets/images/db1.svg",
                            text: 'Account\ninformation'),
                        SizedBox(width: 13.5),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewStatementPage()));
                          },
                          child: IconWithText(
                              imageAsset: "assets/images/stmt.svg",
                              text: 'View\nstatement'),
                        ),
                        SizedBox(width: 13.5),
                        IconWithText(
                            imageAsset: "assets/images/info1.svg",
                            text: 'Balance\ninformation'),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    // Divider(),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.only(
                      //     left: MediaQuery.of(context).size.width * 0.09,
                      //     bottom: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Transaction history header
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Transaction history',
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(height: 16.0),

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // Wrap TextField with Expanded
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: TextField(
                                controller: _searchController,
                                onChanged: (text) {
                                  // setModalState(() {
                                  //   _startSearch(text);
                                  // });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  contentPadding: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    top: 2,
                                    bottom: 10,
                                  ),
                                  hintStyle: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.search,
                                      color: Colors.grey.shade600),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFa52b29),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.93,
                                      padding: EdgeInsets.only(
                                          top: 10.0,
                                          left: 4,
                                          right: 16,
                                          bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: FilterStatementWidget());
                                },
                              );
                            },
                            child: Container(
                              height: 43,
                              width: 43,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/filter.svg',
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
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFFa52b29),
                  unselectedLabelColor: Colors.grey.shade800,
                  indicatorColor: Color(0xFFa52b29),
                  labelStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  unselectedLabelStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  tabs: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Tab(text: 'Completed')),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Tab(text: 'In progress')),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      TransactionDateGroup(date: '23 Aug', transactions: [
                        TransactionItem(
                            description: 'Transaction + sms charge',
                            amount: '-19.26 KES',
                            imagePath: 'assets/images/red_a.png',
                            isSvg: false),
                        TransactionItem(
                            description: 'App/mpesa',
                            amount: '-1,450.00 KES',
                            imagePath: 'assets/images/red_a.png',
                            isSvg: false),
                        TransactionItem(
                            description: 'Disbursement',
                            amount: '+1,500.00 KES',
                            imagePath: 'assets/images/green_a.png',
                            isSvg: false),
                        TransactionItem(
                            description: 'Transaction + sms charge',
                            amount: '-14.46 KES',
                            imagePath: 'assets/images/red_a.png',
                            isSvg: false),
                      ]),
                      TransactionDateGroup(date: '22 Aug', transactions: [
                        TransactionItem(
                            description: 'Transaction + sms charge',
                            amount: '-19.26 KES',
                            imagePath: 'assets/images/red_a.png',
                            isSvg: false),
                        TransactionItem(
                            description: 'App/mpesa',
                            amount: '-1,450.00 KES',
                            imagePath: 'assets/images/red_a.png',
                            isSvg: false),
                        TransactionItem(
                            description: 'Disbursement',
                            amount: '+1,500.00 KES',
                            imagePath: 'assets/images/green_a.png',
                            isSvg: false),
                        TransactionItem(
                            description: 'Transaction + sms charge',
                            amount: '-14.46 KES',
                            imagePath: 'assets/images/red_a.png',
                            isSvg: false),
                      ]),
                    ],
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      TransactionDateGroup(
                          date: 'In progress transactions',
                          transactions: [
                            TransactionItem(
                                description: 'Transaction - Pending approval',
                                amount: '-XX.XX KES',
                                imagePath: 'assets/images/red_a.png',
                                isSvg: false),
                            TransactionItem(
                                description: 'Transaction - Pending settlement',
                                amount: '-XX.XX KES',
                                imagePath: 'assets/images/red_a.png',
                                isSvg: false),
                          ]),
                      // Add more TransactionDateGroup widgets for other in-progress transactions
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          padding: EdgeInsets.all(11),
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
        SizedBox(height: 8.0),
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

class TransactionDateGroup extends StatelessWidget {
  final String date;
  final List<TransactionItem> transactions;

  TransactionDateGroup({required this.date, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(date,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFa52b29),
                ),
              )),
        ),
        Column(children: transactions),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String description;
  final String amount;
  final String imagePath;
  final bool isSvg; // Flag to determine if the image is SVG or not

  TransactionItem({
    required this.description,
    required this.amount,
    required this.imagePath,
    this.isSvg = true, // Default to SVG, can be changed for other image types
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2.0, top: 3),
      margin: const EdgeInsets.only(
        bottom: 10.0,
        left: 17,
        right: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(4),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: isSvg
              ? SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  color: Color(0xFFa52b29),
                  width: 30,
                )
              : Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: 30,
                ),
        ),
        title: Text(
          description,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 14.5,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amount,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
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
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MyAccountsScreen());
}
