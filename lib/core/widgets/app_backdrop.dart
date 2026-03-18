import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class AppBackdrop extends StatelessWidget {
  const AppBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.backdropGradient(isDark),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -90,
            right: -70,
            child: _GlowOrb(color: AppColors.primaryOrb(isDark), size: 240),
          ),
          Positioned(
            top: 180,
            left: -70,
            child: _GlowOrb(color: AppColors.secondaryOrb(isDark), size: 180),
          ),
          Positioned(
            bottom: -120,
            left: 20,
            child: _GlowOrb(color: AppColors.tertiaryOrb(isDark), size: 260),
          ),
          child,
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: <Color>[
              color.withValues(alpha: 0.55),
              color.withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}
