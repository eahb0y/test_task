import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/util/app_utils.dart';
import '../../../../../core/widgets/section_card.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.isLoading,
    this.errorText,
  });

  static const Key signInButtonKey = Key('auth_sign_in_button');
  static const Key signInLoadingKey = Key('auth_sign_in_loading');

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final bool isLoading;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return SectionCard(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              l10n.text('tokenSavedLabel'),
              style: theme.textTheme.titleLarge,
            ),
            AppGaps.v8,
            Text(
              l10n.text('signInMockHint'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (errorText != null) ...<Widget>[
              AppGaps.v16,
              Container(
                width: double.infinity,
                padding: AppPaddings.tile,
                decoration: BoxDecoration(
                  color: theme.colorScheme.errorContainer.withValues(
                    alpha: 0.8,
                  ),
                  borderRadius: AppRadii.chip,
                ),
                child: Text(
                  errorText!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            AppGaps.v20,
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: l10n.text('emailLabel'),
                hintText: l10n.text('emailPlaceholder'),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@')) {
                  return l10n.text('emailPlaceholder');
                }
                return null;
              },
            ),
            AppGaps.v14,
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: l10n.text('passwordLabel'),
                hintText: l10n.text('passwordPlaceholder'),
              ),
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return l10n.text('passwordPlaceholder');
                }
                return null;
              },
            ),
            AppGaps.v20,
            FilledButton(
              key: signInButtonKey,
              onPressed: isLoading ? null : onSubmit,
              child: SizedBox(
                height: 24,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    child: isLoading
                        ? SizedBox(
                            key: signInLoadingKey,
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : Row(
                            key: const ValueKey<String>('auth_sign_in_label'),
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.login_rounded),
                              AppGaps.h8,
                              Text(l10n.text('signInButton')),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
