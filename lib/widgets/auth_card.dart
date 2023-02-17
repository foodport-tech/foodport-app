import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodport_app/widgets/text_field_input.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../utils/colors.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  State<AuthCard> createState() => _AuthCarStated();
}

class _AuthCarStated extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _isLoading = false;
  final _passwordController = TextEditingController();

  // Submit SignIn / SignUp Form Function
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    if (_authMode == AuthMode.Login) {
      // Log user in
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email']!,
        _authData['password']!,
      );
    } else {
      // Sign user up
      await Provider.of<Auth>(context, listen: false).signup(
        _authData['email']!,
        _authData['password']!,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  // Switch Auth Mode (SignIn & SignUp) Function
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // SignIn/SignUp: Email Text Field Input
          TextFormField(
            decoration: InputDecoration(
              labelText: 'email',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Invalid email!';
              }
              return null;
            },
            onSaved: (value) {
              _authData['email'] = value!;
            },
          ),
          const SizedBox(height: 12),

          // SignIn/SignUp: Password Text Field Input
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            controller: _passwordController,
            validator: (value) {
              if (value!.isEmpty || value.length < 5) {
                return 'Password is too short!';
              }
            },
            onSaved: (value) {
              _authData['password'] = value!;
            },
          ),
          const SizedBox(height: 12),

          // SignUp: Confirm Password Text Field Input
          if (_authMode == AuthMode.Signup)
            TextFormField(
              enabled: _authMode == AuthMode.Signup,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              validator: _authMode == AuthMode.Signup
                  ? (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match!';
                      }
                    }
                  : null,
            ),

          // Login Button
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  child: Text(
                    _authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                  ),
                  onPressed: _submit,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  clipBehavior: Clip.none,
                ),

          TextButton(
            child: Text(
              '${_authMode == AuthMode.Login ? "Don't have an account? Sign Up" : 'Already have an account? Login'}',
            ),
            onPressed: _switchAuthMode,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
