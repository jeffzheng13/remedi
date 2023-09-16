import 'package:flutter/material.dart';
import 'package:remedi/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
