import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/shared/domain/entities/account.dart';
import '../../../core/shared/presentation/widgets/parallax_image_card.dart';
import '../../../core/shared/presentation/widgets/account_card.dart';
import '../../../core/shared/presentation/widgets/sh_app_bar.dart';
import '../widgets/card_details_page_view.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          centerTitle: true,
          leading: Hero(
            tag: "app-bar-icon-1",
            child: Material(
              type: MaterialType.transparency,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ),
          )),
      body: AccountDetailItems(
        topPadding: context.mediaQuery.padding.top,
        account: account,
      ),
    );
  }
}

class AccountDetailItems extends StatelessWidget {
  const AccountDetailItems({
    required this.account,
    required this.topPadding,
    this.animation = const AlwaysStoppedAnimation<double>(1),
    super.key,
  });

  final Animation<double> animation;
  final double topPadding;
  final Account account;

  @override
  Widget build(BuildContext context) {
    final outDx = 200 * animation.value;
    final outDy = 100 * animation.value;
    final sigma = 10 * animation.value;
    return Hero(
      tag: account.id,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ParallaxImageCard(imageUrl: account.imageUrl),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
              child: const ColoredBox(color: Colors.transparent),
              // child: const ColoredBox(color: Colors.white),
            ),
          ),
          FadeTransition(
            opacity: Tween<double>(begin: 1, end: 0).animate(animation),
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(-outDx, 0),
                  child: VerticalTitle(accountName: account),
                ),
                Transform.translate(
                  offset: Offset(outDx, outDy),
                  child: const CreditIconButton(),
                ),
                Transform.translate(
                  offset: Offset(0, outDy),
                  child: const AnimatedUpwardArrows(),
                ),
              ],
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: Container(
              transform:
                  Matrix4.translationValues(0, -200 * (1 - animation.value), 0),
              padding: EdgeInsets.only(top: topPadding + 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    account.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'paypal',
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Transaction History',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'paypal',
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 14, top: 12, bottom: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(
                            color: const Color(0xFFf3f3f3),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "Search ...",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.blue.shade900,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue.shade200,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF212121),
                                ),
                              ),
                              cursorColor: Color(0xFFa52b29),
                            ),
                          ),
                        ),
                        Container(
                          height: 46,
                          width: 46,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.format_list_bulleted_sharp,
                              color: Color(0xFFa52b29),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: CardDetailsPageView(
                      animation: animation,
                      account: account,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
