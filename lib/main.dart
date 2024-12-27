import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_frontend/features/auth/auth_service.dart';
import 'package:job_portal_frontend/features/auth/login.dart';
import 'package:job_portal_frontend/home_screen.dart';
import 'package:job_portal_frontend/onboarding_screen.dart';
import 'package:job_portal_frontend/features/auth/signup.dart';
import 'package:job_portal_frontend/provider/user_provider.dart';
import 'package:job_portal_frontend/router.dart';
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
      title:'JobPortal',
      home: MyApp(),
    ),
    ),
    
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClubHub',
    
      onGenerateRoute: (settings) => generateRoute(settings),
      home: _getHomeScreen(),
    );
  }

  Widget _getHomeScreen() {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
       
        if (userProvider.user.token.isNotEmpty && userProvider.user.roles!=null) {
          List<String>?roles= userProvider.user.roles ;
          if (roles![0] == 'USER') {
            return  HomeScreen();
          } 
          else  {
            return HomeScreen();
          }
        } else {
          return  OnboardingScreen();
        }
      },
    );
  }
}

