import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodport_app/widgets/auth_card.dart';

import '../../utils/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            // Horizontally center
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
              // App Logo .svg Image
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/logos/foodport_text_logo.svg',
                  color: orange1Color,
                  height: 48,
                ),
              ),
              const SizedBox(height: 32),
              AuthCard(),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
