import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:remedi/data-models/schema.dart';
import 'package:remedi/pages/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remedi/data-models/schema.dart' as dm;
import 'package:remedi/pages/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:remedi/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Realm realm = Realm(Configuration.local([
    dm.User.schema,
    dm.Procedure.schema,
    dm.Appointment.schema,
    dm.ActionItem.schema,
    dm.Question.schema
  ]));
  realm.write(() {
    realm.addAll([
      dm.User("John", "John@gmail.com", "123"),
      dm.User("John2", "John2@gmail.com", "1234")
    ]);
  });
  RealmResults<dm.User> users = realm.all<dm.User>();
  print(users);
  runApp(const RemediApp());
}

class RemediApp extends StatelessWidget {
  const RemediApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(
        procedure: Procedure(),
      ),
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
