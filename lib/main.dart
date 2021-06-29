import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/pages/welcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Delivery",
      home: LoginPage(), 
    );
  }
}