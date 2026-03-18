import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/auth/presentation/pages/auth_page.dart';
import 'package:test_task/features/home_shell/presentation/pages/home_shell_page.dart';
import 'package:test_task/features/splash/presentation/pages/splash_page.dart';

class AuthGatePage extends StatelessWidget {
  const AuthGatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final Widget child;

        if (state.status == AuthStatus.authenticated && state.session != null) {
          child = HomeShellPage(session: state.session!);
        } else if (state.status == AuthStatus.unknown) {
          child = const SplashPage();
        } else {
          child = const AuthPage();
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 420),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: KeyedSubtree(
            key: ValueKey<AuthStatus>(state.status),
            child: child,
          ),
        );
      },
    );
  }
}
