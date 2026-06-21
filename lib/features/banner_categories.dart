import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class BannerCategories extends StatefulWidget {
  const BannerCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerCategories> createState() => _BannerCategoriesState();
}

class _BannerCategoriesState extends State<BannerCategories> {
  int selectIndex = 2;

  @override
  void initState() {
    super.initState();
  }

  List<String> assets = [
    'assets/images/equity.svg',
    'assets/images/mobile.svg',
    'assets/images/another.svg',
    'assets/images/bills.svg',
    'assets/images/goods.svg',
    'assets/images/airtime.svg'
  ];

  List<String> text1 = ['Send to', 'Send to', 'Send to', 'Pay', 'Buy', 'Buy'];
  List<String> text2 = [
    'Equity',
    'Mobile',
    'Another',
    'Bills',
    'Goods',
    'Airtime'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        CarouselSlider.builder(
          itemCount: assets.length,
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 16 / 5.3,
            viewportFraction: 0.22,
            initialPage: 0,
            enableInfiniteScroll: false,
            padEnds: false,
            onPageChanged: (index, reason) {
              setState(() {
                selectIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              child: ClipRRect(
                  child: Stack(
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: -10,
                                      blurRadius: 12,
                                      offset: const Offset(0, 10))
                                ]),
                            child: Center(
                              child: SvgPicture.asset(
                                assets[index],
                                fit: BoxFit.cover,
                                color: Color(0xFFd21312),
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(text1[index],
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Text(text2[index],
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFFd21312),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              )),
            );
          },
        ),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      height: 25,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(assets.length, (index) {
          return _indicator(index == selectIndex);
        }),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 9 : 5.0,
        width: isActive ? 9 : 5.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isActive ? Color(0xCCa52b29) : Colors.grey.shade400,
        ),
      ),
    );
  }
}
