import 'package:flutter/material.dart';
import 'package:remedi/pages/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data-models/User.dart';
import 'data-models/Procedure.dart';
import 'pages/dashboard.dart';

Procedure procedure = Procedure(
  name: 'Knee surgery',
  summary: 'This is where a summary about the recent operation will go.',
  warnings: ['Warning 1', 'Warning 2'],
  appointments: [],
  actionItems: [],
  faqs: []
);
User user = User(
  name: 'John',
  email: 'john@example.com', 
  password: 'terriblepassword',
  pmh: [procedure]
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(user: user, recentProcedure: procedure,),
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
      //home: loginScreen(),
    );
  }
}
