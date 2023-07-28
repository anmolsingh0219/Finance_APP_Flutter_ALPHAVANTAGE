import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pepcorns/models/asset_provider.dart';
import 'package:pepcorns/pages/asset_search.dart';
import 'package:pepcorns/pages/auth_page.dart';
import 'package:pepcorns/pages/change_assets.dart';
import 'package:pepcorns/pages/historical_data.dart';
import 'package:pepcorns/pages/home_page.dart';
import 'package:pepcorns/pages/login_page.dart';
import 'package:pepcorns/pages/starting_animation_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssetProvider(),
      child: MaterialApp(
        title: 'Asset Search App',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.purple[600],
          backgroundColor: Colors.black,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'SofiaSans',
              color: Colors.white,
              fontSize: 16,
            ),
            // You can define other text styles here as well.
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => StartingAnimationScreen(),
          '/historical_data': (context) => HistoricalDataScreen(),
          '/home_page': (context) => HomePage(),
        },
      ),
    );
  }
}
