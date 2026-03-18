import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../util/app_colors.dart';
import '../util/app_utils.dart';

class AppShimmerBox extends StatelessWidget {
  const AppShimmerBox({
    super.key,
    required this.height,
    this.width,
    this.borderRadius = AppRadii.chip,
  });

  final double height;
  final double? width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark
          ? AppColors.white.withValues(alpha: 0.08)
          : AppColors.white.withValues(alpha: 0.55),
      highlightColor: isDark
          ? AppColors.white.withValues(alpha: 0.18)
          : AppColors.white.withValues(alpha: 0.92),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
