import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:job_portal_frontend/features/auth/auth_service.dart';
import 'package:job_portal_frontend/features/auth/login.dart';
import 'package:job_portal_frontend/features/home-screen/home_screen.dart';
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
  _initializeUserData();
  }
  Future<void> _initializeUserData() async {
  await authService.getUserData(context);  // Ensure this completes
  setState(() {});  // Refresh the UI after data is fetched
}

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JobPortal',
    
      onGenerateRoute: (settings) => generateRoute(settings),
      home: _getHomeScreen(),
    );
  }

  Widget _getHomeScreen() {
  return Consumer<UserProvider>(
    builder: (context, userProvider, _) {
      print(userProvider.user);
      List<String>? roles = userProvider.user.roles;

      // Check if roles is non-null and not empty
      if (roles != null && roles.isNotEmpty) {
        print(roles);
        print("Roles: $roles");
        
        // Navigate based on the first role
        if (roles[0] == 'USER') {
          return HomeScreen();
        } else {
          return HomeScreen(); // Update this to a different screen if needed
        }
      } else {
        // Return onboarding screen if roles is null or empty
        return OnboardingScreen();
      }
    },
  );
}

}

