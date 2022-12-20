import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodport_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/tablet_screen_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/colors.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

void main() async {
  // Initialise Firebase
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyABzu27DTyMD7Pb2jcYfiYbfENtpPZeR7Q",
        appId: "1:975078029701:web:0a8e0e9bf0b301eb0e6cec",
        messagingSenderId: "975078029701",
        projectId: "foodport-app-183e3",
        storageBucket: "foodport-app-183e3.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodport',
        theme: ThemeData(scaffoldBackgroundColor: mobileBackgroundColor),
        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: mobileBackgroundColor,
        // ),

        home: StreamBuilder(
          // 'authStateChanges()' Run only when user log in or log out
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // Connection State: Active (e.g. logged in)
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  tabletScreenLayout: TabletScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // Connection State: Waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            // Other situation. E.g. Snapshot don't have any data
            return const LoginScreen();
          },
        ),

        // home: LoginScreen(),
        // home: SignupScreen(),
        // home: const ResponsiveLayout(
        //   mobileScreenLayout: MobileScreenLayout(),
        //   tabletScreenLayout: TabletScreenLayout(),
        //   webScreenLayout: WebScreenLayout(),
        // ),
        // home: HomeScreen(),
      ),
    );
  }
}
