import 'package:apiexample/presentation/login_screen.dart';
import 'package:apiexample/utility/shared_prefs.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService._();

  static Future<void> logoutUser(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (val) => false);
    await SharedPrefs.clearAll();
  }
}
