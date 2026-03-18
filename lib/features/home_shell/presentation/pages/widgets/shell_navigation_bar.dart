import 'package:flutter/material.dart';
import 'package:test_task/core/util/app_colors.dart';
import 'package:test_task/core/util/app_utils.dart';

class ShellNavigationBar extends StatelessWidget {
  const ShellNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.homeLabel,
    required this.settingsLabel,
  });

  static const Key containerKey = Key('shell_navigation_bar');
  static const double height = 70;

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final String homeLabel;
  final String settingsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      key: containerKey,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(
          alpha: isDark ? 0.95 : 0.88,
        ),
        borderRadius: AppRadii.navigation,
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: _ShellNavigationItem(
              label: homeLabel,
              icon: Icons.grid_view_rounded,
              isSelected: selectedIndex == 0,
              onTap: () => onDestinationSelected(0),
            ),
          ),
          AppGaps.h8,
          Expanded(
            child: _ShellNavigationItem(
              label: settingsLabel,
              icon: Icons.settings_rounded,
              isSelected: selectedIndex == 1,
              onTap: () => onDestinationSelected(1),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShellNavigationItem extends StatelessWidget {
  const _ShellNavigationItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedColor = theme.colorScheme.primary;
    final unselectedColor = theme.colorScheme.onSurfaceVariant;

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadii.tile,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? selectedColor.withValues(alpha: 0.16)
                      : AppColors.transparent,
                  borderRadius: AppRadii.tile,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isSelected
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
