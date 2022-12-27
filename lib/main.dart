// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider_ig.dart';
import '../screens/feed_post/feed_post_screen.dart';
import '../screens/dish_detail_screen.dart';
import '../utils/colors.dart';
import 'providers/posts.dart';

void main() async {
  // Initialise Firebase
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyABzu27DTyMD7Pb2jcYfiYbfENtpPZeR7Q",
  //       appId: "1:975078029701:web:0a8e0e9bf0b301eb0e6cec",
  //       messagingSenderId: "975078029701",
  //       projectId: "foodport-app-183e3",
  //       storageBucket: "foodport-app-183e3.appspot.com",
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider: To register a class which can then listen in the child widget
    return ChangeNotifierProvider(
      // Provide instance of Posts() class to all child widgets
      create: (BuildContext context) => Posts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodport',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primaryColorDark: neutral1Color,
            accentColor: orange1Color,
            backgroundColor: neutral6Color,
          ),
          //fontFamily: 'OpenSans',
          // Fetch from Google Fonts
          // textTheme: GoogleFonts.openSansTextTheme(
          //   Theme.of(context).textTheme,
          // ),
        ),
        darkTheme: ThemeData.dark(),
        home: FeedPostScreen(),
        routes: {
          // DishDetailScreen.routeName = '/dish_detail'
          DishDetailScreen.routeName: (ctx) => DishDetailScreen(),
        },
      ),
    );
  }
}
