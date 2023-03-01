import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  final String apiUrl =
      'ec2-54-95-225-229.ap-northeast-1.compute.amazonaws.com';

  String? _token;
  int? _userId;
  DateTime? _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
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
    final url = Uri.http(apiUrl, urlSegment);

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
      print("RESPONSE DATA: $responseData");

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
    print("RESPONSE DATA _token: ${_token}");
    print("RESPONSE DATA _userId: ${_userId}");
    print("RESPONSE DATA _expiryDate: ${_expiryDate}");
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, '/api/user/create/');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, '/api/user/token/');
  }
}
