import 'package:flutter/material.dart';
import 'package:remedi/data-models/schema.dart';
import 'package:remedi/pages/dashboard.dart';
import 'pages/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(procedure: Procedure(),),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade300, brightness: Brightness.dark),
      ),

    );
  }
}
