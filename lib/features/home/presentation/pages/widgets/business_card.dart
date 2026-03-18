import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/util/app_utils.dart';
import '../../../../../core/widgets/section_card.dart';
import '../../../domain/entities/dashboard_data.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key, required this.business});

  final Business business;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(business.name, style: theme.textTheme.titleLarge),
                    AppGaps.v4,
                    Text(
                      '${business.industry} • ${business.location}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: AppPaddings.chip,
                decoration: BoxDecoration(
                  borderRadius: AppRadii.chip,
                  color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                ),
                child: Text(
                  l10n.text('statusActive'),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          AppGaps.v18,
          Row(
            children: <Widget>[
              Expanded(
                child: _BusinessMetric(
                  label: l10n.text('activeProjectsLabel'),
                  value: '${business.activeProjects}',
                ),
              ),
              AppGaps.h10,
              Expanded(
                child: _BusinessMetric(
                  label: l10n.text('teamSizeLabel'),
                  value: '${business.teamSize}',
                ),
              ),
              AppGaps.h10,
              Expanded(
                child: _BusinessMetric(
                  label: l10n.text('monthlyRevenueLabel'),
                  value: '\$${business.monthlyRevenue.toStringAsFixed(0)}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BusinessMetric extends StatelessWidget {
  const _BusinessMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: AppPaddings.tile,
      decoration: BoxDecoration(
        borderRadius: AppRadii.chip,
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.45,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
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
