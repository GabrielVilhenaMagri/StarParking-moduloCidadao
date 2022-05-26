import 'package:star_parking_app_cidadao/app_widget.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

          return AppWidget();
        }
 }
