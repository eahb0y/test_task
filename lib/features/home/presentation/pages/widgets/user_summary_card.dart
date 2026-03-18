import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/util/app_utils.dart';
import '../../../../../core/widgets/section_card.dart';
import '../../../domain/entities/dashboard_data.dart';

class UserSummaryCard extends StatelessWidget {
  const UserSummaryCard({super.key, required this.dashboard});

  final DashboardData dashboard;

  @override
  Widget build(BuildContext context) {
    final profile = dashboard.profile;
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return SectionCard(
      color: theme.colorScheme.primary.withValues(alpha: 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.surface.withValues(alpha: 0.88),
                ),
                child: Text(
                  profile.fullName.characters.first,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              AppGaps.h14,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${l10n.text('helloLabel')}, ${profile.fullName}',
                      style: theme.textTheme.titleLarge,
                    ),
                    AppGaps.v6,
                    Text(
                      profile.role,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AppGaps.v18,
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              _ProfileChip(
                label: '${l10n.text('locationLabel')}: ${profile.location}',
              ),
              _ProfileChip(label: '${l10n.text('planLabel')}: ${profile.plan}'),
              _ProfileChip(
                label:
                    '${l10n.text('memberSinceLabel')}: ${profile.memberSince}',
              ),
              _ProfileChip(
                label:
                    '${l10n.text('verifiedLabel')}: ${profile.isVerified ? l10n.text('statusActive') : '-'}',
              ),
            ],
          ),
          AppGaps.v18,
          Row(
            children: <Widget>[
              Expanded(
                child: _MetricTile(
                  label: l10n.text('businessCountLabel'),
                  value: '${dashboard.businessCount}',
                ),
              ),
              AppGaps.h10,
              Expanded(
                child: _MetricTile(
                  label: l10n.text('activeProjectsLabel'),
                  value: '${dashboard.totalActiveProjects}',
                ),
              ),
              AppGaps.h10,
              Expanded(
                child: _MetricTile(
                  label: l10n.text('monthlyRevenueLabel'),
                  value:
                      '\$${dashboard.totalMonthlyRevenue.toStringAsFixed(0)}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileChip extends StatelessWidget {
  const _ProfileChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: AppPaddings.chip,
      decoration: BoxDecoration(
        borderRadius: AppRadii.chip,
        color: theme.colorScheme.surface.withValues(alpha: 0.82),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: AppPaddings.tile,
      decoration: BoxDecoration(
        borderRadius: AppRadii.tile,
        color: theme.colorScheme.surface.withValues(alpha: 0.82),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          AppGaps.v6,
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
