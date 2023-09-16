import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:remedi/pages/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remedi/pages/dashboard.dart';

void main() {
  runApp(const RemediApp());
}

class RemediApp extends StatelessWidget {
  const RemediApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Dashboard(procedure: Procedure(),),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green.shade300, brightness: Brightness.light),
          textTheme: TextTheme(
              displayLarge: GoogleFonts.poppins(fontSize: 58),
              bodyMedium: GoogleFonts.poppins(),
              labelMedium: GoogleFonts.poppins())),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: loginScreen(),
    );
  }
}
