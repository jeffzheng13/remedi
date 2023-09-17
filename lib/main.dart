import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/firebase_options.dart';
import 'package:remedi/pages/auth.dart';
import 'package:remedi/pages/fetch.dart';
import 'package:remedi/pages/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remedi/pages/dashboard.dart';
import 'package:remedi/pages/signUpScreen.dart';
import 'package:remedi/pages/user.dart';
import 'package:remedi/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

final _messageStreamController = BehaviorSubject<RemoteMessage>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
 await Firebase.initializeApp();

 if (kDebugMode) {
   print("Handling a background message: ${message.messageId}");
   print('Message data: ${message.data}');
   print('Message notification: ${message.notification?.title}');
   print('Message notification: ${message.notification?.body}');
 }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }



  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _messageStreamController.sink.add(message);
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(new RemediApp());
}

class RemediApp extends StatelessWidget {
  const RemediApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
        initialData: null,
        value: AuthService().user,
        child: MaterialApp(
          home: wrapper(),
          routes: <String, WidgetBuilder>{
            '/login': (context) => loginScreen(),
            '/signup': (context) => signUpScreen(),
            //'/dashboard': (context) => Dashboard(),
          },
          //home: Dashboard(procedure: Procedure(),),
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.green.shade300,
                  brightness: Brightness.light),
              textTheme: TextTheme(
                  displayLarge: GoogleFonts.poppins(fontSize: 58),
                  bodyMedium: GoogleFonts.poppins(),
                  labelMedium: GoogleFonts.poppins())),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
        ));
  }
}
