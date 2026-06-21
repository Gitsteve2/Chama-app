import 'package:chama/features/accounts_page.dart';
import 'package:chama/features/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app/app.dart';
import '../home_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool isSwitched = false;
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.89,
        child: Drawer(
          child: Container(
              color: Colors.white,
              child: ListView(children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015,
                    bottom: MediaQuery.of(context).size.height * 0.015,
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.042,
                    left: MediaQuery.of(context).size.width * 0.042,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Color(0xFFa52b29), width: 2)),
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
                      SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DISHON POLYCAP',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          SizedBox(height: 7),
                          Text('05410123779424',
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/active_chat.svg",
                        fit: BoxFit.cover,
                        color: Color(0xFFa52b29),
                        width: 28,
                      ),
                    ),
                  ),
                  title: Text('Activate Chat Banking',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey.shade600, size: 22),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/recommend.svg",
                        fit: BoxFit.cover,
                        color: Color(0xFFa52b29),
                        width: 32,
                      ),
                    ),
                  ),
                  title: Text('Recommend',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey.shade600, size: 22),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/get_in_touch.svg",
                        fit: BoxFit.cover,
                        color: Color(0xFFa52b29),
                        width: 36,
                      ),
                    ),
                  ),
                  title: Text('Get in touch',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey.shade600, size: 22),
                  ),
                  onTap: () {},
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding:
                                  EdgeInsets.only(left: 5, right: 6, top: 2),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/images/dark_mode.svg",
                                  fit: BoxFit.cover,
                                  color: Color(0xFFa52b29),
                                  width: 38,
                                ),
                              ),
                            ),
                            SizedBox(width: 18),
                            Text('Dark mode',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 18,
                                    height: 1.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      CupertinoSwitch(
                          value: isSwitched,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeColor: Color(0xFFa52b29),
                          trackColor: Colors.grey.shade600),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1, bottom: 3),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/power2.svg",
                          fit: BoxFit.cover,
                          color: Color(0xFFa52b29),
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                  title: Text('Sign out',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey.shade600, size: 22),
                  ),
                  onTap: () {},
                ),
                Spacer(),
                SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('Version 0.0.330',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ])),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => Container(
          height: 80,
          width: 80,
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == 1
                ? Colors.white
                : Colors.blue,
            borderRadius: BorderRadius.circular(110),
          ),
          child: FloatingActionButton(
            onPressed: () {
              controller.selectedIndex.value = 1;
            },
            child: Container(
              height: 68,
              width: 68,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: Color(0xFFd21312), width: 2),
              ),
              child: Center(
                child: Container(
                  height: 43,
                  width: 43,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/equity_logo.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return TextStyle(
                    fontSize: 13,
                    color: Color(0xFFd21312),
                    fontFamily: 'paypal',
                  );
                } else {
                  return TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontFamily: 'paypal',
                  );
                }
              },
            ),
          ),
          child: NavigationBar(
            height: 75,
            elevation: 0,
            backgroundColor: Colors.white,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: NavigationDestination(
                  icon: SvgPicture.asset(
                    "assets/images/equity.svg",
                    fit: BoxFit.cover,
                    color: Colors.grey.shade600,
                    width: 39,
                  ),
                  selectedIcon: Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: SvgPicture.asset(
                      "assets/images/ac.svg",
                      fit: BoxFit.cover,
                      color: Color(0xFFa52b29),
                      width: 28,
                    ),
                  ),
                  label: 'Accounts & Cards',
                ),
              ),
              NavigationDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(
                    Icons.home,
                    size: 2,
                  ),
                  label: ''),
              NavigationDestination(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Colors.grey.shade600,
                    size: 28,
                  ),
                  selectedIcon: Icon(
                    Icons.settings,
                    color: Color(0xFFa52b29),
                    size: 28,
                  ),
                  label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;

  final screens = [AccountsPage(), HomePage(), SettingsPage()];
}
