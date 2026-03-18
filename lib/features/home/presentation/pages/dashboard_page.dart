import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/localization/app_localizations.dart';
import 'package:test_task/core/util/app_utils.dart';
import 'package:test_task/core/widgets/app_shimmer_box.dart';
import 'package:test_task/core/widgets/section_card.dart';
import 'package:test_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:test_task/features/home/presentation/pages/widgets/business_card.dart';
import 'package:test_task/features/home/presentation/pages/widgets/dashboard_shimmer.dart';
import 'package:test_task/features/home/presentation/pages/widgets/user_summary_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.failure) {
          return ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: <Widget>[
              SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.text('dashboardTitle'),
                      style: theme.textTheme.displaySmall,
                    ),
                    AppGaps.v12,
                    Text(
                      l10n.text('dashboardSubtitle'),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    AppGaps.v20,
                    FilledButton.icon(
                      onPressed: () {
                        context.read<HomeBloc>().add(const HomeRequested());
                      },
                      icon: const Icon(Icons.refresh_rounded),
                      label: Text(l10n.text('retryButton')),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        if (state.status == HomeStatus.loading || state.dashboard == null) {
          return ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: <Widget>[DashboardShimmer()],
          );
        }

        final dashboard = state.dashboard!;

        return RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(const HomeRefreshed());
          },
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: <Widget>[
              Text(
                l10n.text('dashboardTitle'),
                style: theme.textTheme.displaySmall,
              ),
              if (state.isRefreshing) ...<Widget>[
                AppGaps.v14,
                const AppShimmerBox(height: 10),
              ],
              AppGaps.v20,
              UserSummaryCard(dashboard: dashboard),
              AppGaps.v18,
              Text(
                l10n.text('businessesTitle'),
                style: theme.textTheme.titleLarge,
              ),
              AppGaps.v12,
              if (dashboard.businesses.isEmpty)
                SectionCard(
                  child: Text(
                    l10n.text('businessesEmpty'),
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ...dashboard.businesses.map(
                (business) => Padding(
                  padding: AppPaddings.listBottom,
                  child: BusinessCard(business: business),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
