// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodport_app/screens/seller_profile_screen.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider_ig.dart';
import 'screens/1_feed_post_screen/feed_post_screen.dart';
import '../screens/dish_detail_screen.dart';
import '../utils/colors.dart';
import 'providers/dishes.dart';
import 'providers/posts.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/responsive_layout_screen.dart';
import 'responsive/tablet_screen_layout.dart';
import 'responsive/web_screen_layout.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Provide instance of Posts() class to all child widgets
          create: (BuildContext context) => Posts(),
        ),
        ChangeNotifierProvider(
          // Provide instance of Dishes() class to all child widgets
          create: (BuildContext context) => Dishes(),
        ),
      ],
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
        // home: FeedPostScreen(),
        initialRoute: '/', // default is '/'
        routes: {
          // Home:
          '/': (context) => ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                tabletScreenLayout: TabletScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              ),
          // Main 1: '/feed_post'
          // Main 2: '/explore'
          // Main 3: '/create_post'
          // Main 4: '/inbox'
          // Main 5: '/profile'
          // '/dish_detail'
          DishDetailScreen.routeName: (context) => DishDetailScreen(),
          SellerProfileScreen.routeName: (context) => SellerProfileScreen(),
          // Auth: '/login'
          // Auth: '/signup'
        },
        // When route does not work correctly
        // onGenerateRoute: (settings) {},
        // Fallback Screen - E.g. 404 Screen
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            // TODO: Replace with 404 screen
            builder: (context) => FeedPostScreen(),
          );
        },
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider.value(
    //       value: Auth(),
    //     ),
    //     ChangeNotifierProxyProvider<Auth, Products>(
    //       builder: (ctx, auth, previousProducts) => Products(
    //             auth.token,
    //             auth.userId,
    //             previousProducts == null ? [] : previousProducts.items,
    //           ),
    //     ),
    //     ChangeNotifierProvider.value(
    //       value: Cart(),
    //     ),
    //     ChangeNotifierProxyProvider<Auth, Orders>(
    //       builder: (ctx, auth, previousOrders) => Orders(
    //             auth.token,
    //             auth.userId,
    //             previousOrders == null ? [] : previousOrders.orders,
    //           ),
    //     ),
    //   ],
    //   child: Consumer<Auth>(
//         builder: (ctx, auth, _) => MaterialApp(
//               title: 'MyShop',
//               theme: ThemeData(
//                 primarySwatch: Colors.purple,
//                 accentColor: Colors.deepOrange,
//                 fontFamily: 'Lato',
//               ),
//               home: auth.isAuth
//                   ? ProductsOverviewScreen()
//                   : FutureBuilder(
//                       future: auth.tryAutoLogin(),
//                       builder: (ctx, authResultSnapshot) =>
//                           authResultSnapshot.connectionState ==
//                                   ConnectionState.waiting
//                               ? SplashScreen()
//                               : AuthScreen(),
//                     ),
//               routes: {
//                 ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
//                 CartScreen.routeName: (ctx) => CartScreen(),
//                 OrdersScreen.routeName: (ctx) => OrdersScreen(),
//                 UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
//                 EditProductScreen.routeName: (ctx) => EditProductScreen(),
//               },
//             ),
//       ),
//     );
//   }
// }
