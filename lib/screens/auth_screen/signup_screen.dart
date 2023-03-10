import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodport_app/responsive/mobile_screen_layout.dart';
import 'package:foodport_app/responsive/responsive_layout_screen.dart';
import 'package:foodport_app/responsive/tablet_screen_layout.dart';
import 'package:foodport_app/responsive/web_screen_layout.dart';
import 'package:foodport_app/screens/auth_screen/login_screen.dart';
import 'package:foodport_app/utils/utils.dart';

import '../../resources/auth_methods.dart';
import '../../utils/colors.dart';
import '../../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void signupUser() async {
    // Refresh screen to show 'loading' in 'Sign up button'
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signupUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );

    // Refresh screen to stop showing 'loading' in 'Sign up button'
    setState(() {
      _isLoading = false;
    });

    // When Signup Success
    if (res != 'success') {
      // Show pop message to user
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            tabletScreenLayout: TabletScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
  }

  void navigateToLoginScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

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
                child: Container(),
                flex: 2,
              ),
              // App Logo .svg Image
              SvgPicture.asset(
                'assets/images/logos/foodport_text_logo.svg',
                color: orange1Color,
                height: 48,
              ),
              const SizedBox(height: 32),

              // Username Text Field Input
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.emailAddress,
                textEditingController: _usernameController,
              ),
              const SizedBox(height: 12),

              // Email Text Field Input
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 12),

              // Password Text Field Input
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 12),

              // Sign up Button
              InkWell(
                onTap: signupUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: orange1Color,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),

              // Transitioning to sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Already have an account? "),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLoginScreen,
                    child: Container(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
