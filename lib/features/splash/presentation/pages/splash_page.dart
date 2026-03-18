import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/util/app_colors.dart';
import '../../../../../core/util/app_utils.dart';
import '../../../../../core/widgets/app_backdrop.dart';
import '../../../../../core/widgets/app_shimmer_box.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return AppBackdrop(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Padding(
            padding: AppPaddings.screenLarge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),
                Text(
                  l10n.text('loadingSession'),
                  style: theme.textTheme.displaySmall,
                ),
                AppGaps.v12,
                Text(
                  l10n.text('authenticating'),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                AppGaps.v24,
                const AppShimmerBox(height: 120),
                AppGaps.v14,
                const AppShimmerBox(height: 72),
                AppGaps.v14,
                const AppShimmerBox(height: 72),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
