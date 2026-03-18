import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/constants/app_constants.dart';
import 'package:test_task/core/localization/app_localizations.dart';
import 'package:test_task/core/util/app_colors.dart';
import 'package:test_task/core/util/app_utils.dart';
import 'package:test_task/core/widgets/app_backdrop.dart';
import 'package:test_task/core/widgets/section_card.dart';
import 'package:test_task/features/auth/domain/entities/auth_failure.dart';
import 'package:test_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_task/features/auth/presentation/pages/widgets/auth_form.dart';
import 'package:test_task/features/auth/presentation/pages/widgets/social_login_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: AppConstants.mockEmail);
    _passwordController = TextEditingController(
      text: AppConstants.mockPassword,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return AppBackdrop(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final isLoading = state.status == AuthStatus.authenticating;

              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: AppPaddings.screen,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AuthForm(
                            key: const ValueKey<String>('auth-form'),
                            formKey: _formKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            errorText: _mapError(context, state.errorType),
                            onSubmit: _submit,
                            isLoading: isLoading,
                          ),
                          AppGaps.v18,
                          SectionCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  l10n.text('socialLockedHint'),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                AppGaps.v18,
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    final isCompact =
                                        constraints.maxWidth < 480;

                                    if (isCompact) {
                                      return Column(
                                        children: <Widget>[
                                          SocialLoginButton(
                                            label: l10n.text('googleButton'),
                                            badgeLabel: l10n.text(
                                              'socialComingSoon',
                                            ),
                                            leading: const _SocialGlyph(
                                              text: 'G',
                                            ),
                                          ),
                                          AppGaps.v12,
                                          SocialLoginButton(
                                            label: l10n.text('appleButton'),
                                            badgeLabel: l10n.text(
                                              'socialComingSoon',
                                            ),
                                            leading: const Icon(
                                              Icons.apple_rounded,
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                    return Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: SocialLoginButton(
                                            label: l10n.text('googleButton'),
                                            badgeLabel: l10n.text(
                                              'socialComingSoon',
                                            ),
                                            leading: const _SocialGlyph(
                                              text: 'G',
                                            ),
                                          ),
                                        ),
                                        AppGaps.h12,
                                        Expanded(
                                          child: SocialLoginButton(
                                            label: l10n.text('appleButton'),
                                            badgeLabel: l10n.text(
                                              'socialComingSoon',
                                            ),
                                            leading: const Icon(
                                              Icons.apple_rounded,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<AuthBloc>().add(
      AuthSignInRequested(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  String? _mapError(BuildContext context, AuthFailureType? errorType) {
    if (errorType == null) {
      return null;
    }

    return switch (errorType) {
      AuthFailureType.invalidCredentials => context.l10n.text(
        'invalidCredentials',
      ),
      AuthFailureType.unknown => context.l10n.text('invalidCredentials'),
    };
  }
}

class _SocialGlyph extends StatelessWidget {
  const _SocialGlyph({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.primary.withValues(alpha: 0.14),
      ),
      child: Text(
        text,
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
