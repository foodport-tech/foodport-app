import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodport_app/widgets/auth_card.dart';

import '../../resources/auth_methods.dart';
import '../../responsive/responsive_layout_screen.dart';
import '../../responsive/mobile_screen_layout.dart';
import '../../responsive/tablet_screen_layout.dart';
import '../../responsive/web_screen_layout.dart';
import 'signup_screen.dart';
import '../../utils/utils.dart';
import '../../utils/colors.dart';
import '../../widgets/text_field_input.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 32),
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
