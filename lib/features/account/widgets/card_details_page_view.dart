import 'package:chama/features/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/shared/domain/entities/account.dart';

class CardDetailsPageView extends StatelessWidget {
  const CardDetailsPageView({
    required this.animation,
    required this.account,
    super.key,
  });

  final Animation<double> animation;
  final Account account;

  Animation<double> get _interval1 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.4, 1, curve: Curves.easeIn),
      );

  Animation<double> get _interval2 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.6, 1, curve: Curves.easeIn),
      );

  Animation<double> get _interval3 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.8, 1, curve: Curves.easeIn),
      );

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.shade200,
                child: Expanded(
                  child: DefaultTextStyle(
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      children: [
                        SlideTransition(
                          position: Tween(
                            begin: const Offset(0, 2),
                            end: Offset.zero,
                          ).animate(_interval1),
                          child: FadeTransition(
                            opacity: _interval1,
                            child: Row(
                              children: [
                                Expanded(child: TransactionPage()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
