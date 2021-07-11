import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home_page/HomePage.dart';
import 'package:food_delivery/pages/login_page.dart';
import 'package:food_delivery/provider/my_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff2b2b2b),
            appBarTheme: AppBarTheme(
              color: Color(0xff2b2b2b),
            )),
        title: "Food Delivery",
        // home: WelcomePage(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print(snapshot.toString());
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
