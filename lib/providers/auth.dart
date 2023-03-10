import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../utils/api_links.dart';

class Auth with ChangeNotifier {
  String? _token;
  int? _userId;
  DateTime? _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    print("//auth.dart - function get token - _expiryDate: $_expiryDate");
    print(
        "//auth.dart - function get token - DateTime.now(): ${DateTime.now()}");
    print("//auth.dart - function get token - _token: $_token");

    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      print("//auth.dart - function get token: If Statement PASS");
      return _token;
    }

    return null;
  }

  int? get userId {
    return _userId;
  }

  Future<void> _authenticate(
    String email,
    String password,
    String urlSegment,
  ) async {
    print("//auth.dart - function _authenticate called");
    final url = Uri.http(ApiLinks.baseUrl, urlSegment);

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);

      // TODO: Remove print();
      print("//auth.dart - _authenticate - responseData: $responseData");

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: responseData['expiresIn']),
      );

      notifyListeners();
    } catch (error) {
      throw error;
    }
    // TODO: Remove print();
    print("//auth.dart - function _authenticate - _token: ${_token}");
    print("//auth.dart - function _authenticate - _userId: ${_userId}");
    print("//auth.dart - function _authenticate - _expiryDate: ${_expiryDate}");
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, ApiLinks.signUp);
  }

  Future<void> login(String email, String password) async {
    print("//auth.dart - function login called");
    return _authenticate(email, password, ApiLinks.login);
  }
}
