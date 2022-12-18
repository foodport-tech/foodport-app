import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/tablet_screen_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/colors.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodport',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        tabletScreenLayout: TabletScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ), //const HomeScreen(),
    );
  }
}
