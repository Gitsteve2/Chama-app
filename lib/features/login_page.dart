import 'package:chama/features/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  int currentindex = 0;
  bool hideBalance = true;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isPasswordEntered = false;

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
  void dispose() {
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isMorning = now.hour < 12;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/login.jpg",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(shrinkWrap: true, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  Center(
                    child: SvgPicture.asset(
                      "assets/images/get_in_touch.svg",
                      fit: BoxFit.cover,
                      color: Colors.black,
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                padding: EdgeInsets.only(left: 5, right: 6, top: 2),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.055,
                  bottom: MediaQuery.of(context).size.height * 0.022,
                  left: MediaQuery.of(context).size.width * 0.415,
                  right: MediaQuery.of(context).size.width * 0.415,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0xFFa52b29), width: 2)),
                child: Center(
                  child: Text('DP',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Color(0xFFa52b29),
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15.0, top: 5, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isMorning ? 'Good morning, ' : 'Good evening, ',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Text('Dishon',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 21.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 21.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.067,
                padding: EdgeInsets.only(
                  top: 15.0,
                ),
                color: Colors.white,
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  onChanged: (value) {
                    setState(() {
                      _isPasswordEntered = value.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    contentPadding: EdgeInsets.only(
                      right: 15,
                    ),
                    hintStyle: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFa52b29),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15.0, top: 25, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Forgot your password?',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFFa52b29),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.095,
            color:
                Colors.transparent, // Transparent background for the container
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor:
                  Colors.transparent, // Transparent background for the FAB
              elevation: 0, // Remove shadow if needed
              splashColor: Colors.transparent, // Prevent splash color
              highlightElevation: 0, // Prevent elevation when pressed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.095,
                padding:
                    EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 24),
                child: ElevatedButton(
                  onPressed: _isPasswordEntered
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NavigationMenu()));
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_isPasswordEntered
                        ? Color.fromRGBO(240, 240, 240, 0.5)
                        : Color(0xFFa52b29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Let me in',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: _isPasswordEntered
                            ? Colors.white
                            : Colors.grey.shade600,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
