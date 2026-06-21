import 'package:flutter/material.dart';
import '../../../../core/theme/sh_colors.dart';

class LightedBackgound extends StatelessWidget {
  const LightedBackgound({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: SHColors.backgroundColor),
        child,
      ],
    );
  }
}
