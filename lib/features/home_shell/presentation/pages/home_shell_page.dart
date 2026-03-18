import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/localization/app_localizations.dart';
import 'package:test_task/core/util/app_colors.dart';
import 'package:test_task/core/util/app_utils.dart';
import 'package:test_task/core/widgets/app_backdrop.dart';
import 'package:test_task/dependency_injection.dart';
import 'package:test_task/features/auth/domain/entities/auth_session.dart';
import 'package:test_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:test_task/features/home/presentation/pages/dashboard_page.dart';
import 'package:test_task/features/home_shell/presentation/pages/widgets/shell_navigation_bar.dart';
import 'package:test_task/features/settings/presentation/pages/settings_page.dart';

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key, required this.session});

  final AuthSession session;

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          getIt<HomeBloc>(param1: widget.session.token)
            ..add(const HomeRequested()),
      child: AppBackdrop(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          extendBody: true,
          body: SafeArea(
            child: Padding(
              padding: AppPaddings.shellContent,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 260),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                child: KeyedSubtree(
                  key: ValueKey<int>(_currentIndex),
                  child: _currentIndex == 0
                      ? const DashboardPage()
                      : const SettingsPage(),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            top: false,
            minimum: AppPaddings.shellNavigation,
            child: ShellNavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              homeLabel: context.l10n.text('homeTab'),
              settingsLabel: context.l10n.text('settingsTab'),
            ),
          ),
        ),
      ),
    );
  }
}
