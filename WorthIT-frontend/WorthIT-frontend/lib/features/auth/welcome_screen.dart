import 'package:flutter/material.dart';
import '../../core/widgets/logo_widget.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/outlined_primary_button.dart';
import '../../core/widgets/responsive.dart';
import '../../navigation/app_routes.dart'; // 1. Import your routes file

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(resp.scale(24)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: LogoWidget(size: 50, fontSize: 24),
                    ),
                    SizedBox(height: resp.scale(40)),
                    const Text(
                      'Welcome to\nWorthIT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: resp.scale(40)),
                    PrimaryButton(
                      label: 'Continue with Google',
                      onPressed: () {
                        // 2. Use the constant variable instead of the string '/product-analysis'
                        Navigator.pushNamed(context, AppRoutes.analyze);
                      },
                    ),
                    SizedBox(height: resp.scale(16)),
                    OutlinedPrimaryButton(
                      label: 'Continue as Guest',
                      onPressed: () {
                        // 3. Match the same constant here
                        Navigator.pushNamed(context, AppRoutes.analyze);
                      },
                    ),
                    SizedBox(height: resp.scale(24)),
                    Text(
                      'We do not promote or sell products.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
