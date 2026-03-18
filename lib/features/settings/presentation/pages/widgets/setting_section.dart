import 'package:flutter/material.dart';

import '../../../../../core/util/app_utils.dart';
import '../../../../../core/widgets/section_card.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: theme.textTheme.titleLarge),
          AppGaps.v8,
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          AppGaps.v20,
          child,
        ],
      ),
    );
  }
}
