// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCZvQnVEA5pE1LHmXwtxGmcxE0Nq5ihbZU',
    appId: '1:651584928166:web:5e03e8371fd9ae8b54f767',
    messagingSenderId: '651584928166',
    projectId: 'remedi-a9712',
    authDomain: 'remedi-a9712.firebaseapp.com',
    storageBucket: 'remedi-a9712.appspot.com',
    measurementId: 'G-ZL5PSQW5J1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATpjhdIF42LRNrWfjPWAFXb_EpY3HO7_g',
    appId: '1:651584928166:android:ed79791f04e2113754f767',
    messagingSenderId: '651584928166',
    projectId: 'remedi-a9712',
    storageBucket: 'remedi-a9712.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJoR7714___fAoWwumNyOP_14vLJcoMoQ',
    appId: '1:651584928166:ios:2c6813b89354b5a054f767',
    messagingSenderId: '651584928166',
    projectId: 'remedi-a9712',
    storageBucket: 'remedi-a9712.appspot.com',
    iosBundleId: 'com.example.remedi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJoR7714___fAoWwumNyOP_14vLJcoMoQ',
    appId: '1:651584928166:ios:3581a8bd5d59404c54f767',
    messagingSenderId: '651584928166',
    projectId: 'remedi-a9712',
    storageBucket: 'remedi-a9712.appspot.com',
    iosBundleId: 'com.example.remedi.RunnerTests',
  );
}