import 'package:flutter/material.dart';

import '../../../../../core/util/app_utils.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.leading,
    required this.badgeLabel,
  });

  final String label;
  final Widget leading;
  final String badgeLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: null,
      child: Row(
        children: <Widget>[
          leading,
          AppGaps.h8,
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          AppGaps.h8,
          Container(
            padding: AppPaddings.compactChip,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.7,
              ),
              borderRadius: AppRadii.medium,
            ),
            child: Text(
              badgeLabel,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
