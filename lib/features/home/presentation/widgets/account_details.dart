import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

import '../../../../core/core.dart';
import '../../../generate_statement_page.dart';

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({
    required this.account,
    required this.translation,
    super.key,
  });

  final Account account;
  final double translation;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, 100 * translation, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue.shade900.withOpacity(0.9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 10,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            height10,
            Align(
              alignment: Alignment.center,
              child: Text(
                "Current Account",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'paypal',
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            height4,
            Align(
              alignment: Alignment.center,
              child: Text(
                "50,550.00 KES",
                style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'paypal',
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            height12,
            const SHDivider(),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => GenerateStatement()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Color(0xFFa52b29),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/images/stment.svg",
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                  width: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'View \nStatement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'paypal',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Color(0xFFa52b29),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/top_up.svg",
                                fit: BoxFit.cover,
                                color: Colors.white,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Top Up \nCard',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'paypal',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Color(0xFFa52b29),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/mng_card.svg",
                                fit: BoxFit.cover,
                                color: Colors.white,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Manage \nCard',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'paypal',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
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

class _DeviceIconSwitcher extends StatelessWidget {
  const _DeviceIconSwitcher({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.value,
  });

  final Text label;
  final Icon icon;
  final bool value;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    final color = value ? SHColors.selectedColor : SHColors.textColor;
    return InkWell(
      onTap: () => onTap(!value),
      child: Column(
        children: [
          IconTheme(
            data: IconThemeData(color: color, size: 24.sp),
            child: icon,
          ),
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: context.bodySmall.copyWith(color: color),
            child: label,
          ),
          Text(
            value ? 'ON' : 'OFF',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountInfoRow extends StatelessWidget {
  const _AccountInfoRow({
    required this.icon,
    required this.label,
    required this.data,
  });

  final Icon icon;
  final Text label;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width32,
        IconTheme(
          data: context.iconTheme.copyWith(size: 18.sp),
          child: icon,
        ),
        width4,
        Expanded(
          child: DefaultTextStyle(
            style: context.bodySmall.copyWith(
              color: data == null ? context.textColor.withOpacity(.6) : null,
            ),
            child: label,
          ),
        ),
        if (data != null)
          Text(
            data!,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          )
        else
          Row(
            children: [
              const BlueLightDot(),
              width4,
              Text(
                'OFF',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 12.sp,
                  color: SHColors.textColor.withOpacity(.6),
                ),
              ),
            ],
          ),
        width32,
      ],
    );
  }
}
