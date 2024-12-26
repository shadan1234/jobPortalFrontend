import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_frontend/features/auth/login.dart';
import 'package:job_portal_frontend/onboarding_screen.dart';
import 'package:job_portal_frontend/features/auth/signup.dart';
import 'package:job_portal_frontend/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    ),
    ),
    
  );
}

