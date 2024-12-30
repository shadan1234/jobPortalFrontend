import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_portal_frontend/globals.dart';

void showSnackBar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}
void httpErrorHandle({required http.Response response,required VoidCallback onSuccess,}){
  switch(response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
    showSnackBar(jsonDecode(response.body));
    break;
    case 500:
     showSnackBar( jsonDecode(response.body));
     break;
     default:
     showSnackBar( response.body);
  }
}
