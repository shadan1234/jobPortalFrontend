import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_portal_frontend/commons/error_handling.dart';
import 'package:job_portal_frontend/globals.dart';
import 'package:job_portal_frontend/home_screen.dart';
import 'package:job_portal_frontend/models/user.dart';
import 'package:job_portal_frontend/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  // Register User
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
     Map<String, dynamic> body = {
  'name': name,
  'email': email,
  'password': password,
};
      http.Response res = await http.post(
        Uri.parse('$uri/register'),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account created! Please log in.");
          Navigator.pushNamed(context, '/login');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Login User
  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Fetch user data
  Future<void> getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: {'Content-Type': 'application/json; charset=UTF-8', 'x-auth-token': token!},
      );

      var isValidToken = jsonDecode(tokenRes.body);
      if (isValidToken) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'x-auth-token': token},
        );

        UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Logout
  Future<void> logOut(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
