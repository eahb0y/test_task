import 'package:flutter/material.dart';

import '../util/app_colors.dart';
import '../util/app_utils.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.child,
    this.padding = AppPaddings.card,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color:
            color ??
            theme.colorScheme.surface.withValues(alpha: isDark ? 0.9 : 0.82),
        borderRadius: AppRadii.card,
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 24,
            offset: const Offset(0, 12),
            color: AppColors.black.withValues(alpha: isDark ? 0.16 : 0.06),
          ),
        ],
      ),
      child: child,
    );
  }
}
