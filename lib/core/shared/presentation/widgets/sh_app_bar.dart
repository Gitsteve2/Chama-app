import 'package:flutter/material.dart';

import '../../../theme/sh_icons.dart';

class ShAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Hero(
        tag: "app-bar-icon-1",
        child: Material(
          type: MaterialType.transparency,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              SHIcons.menu,
              color: Color(0xFFa52b29),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
