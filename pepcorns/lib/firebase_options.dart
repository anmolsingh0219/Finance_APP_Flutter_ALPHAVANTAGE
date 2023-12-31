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
    apiKey: 'AIzaSyAd3-zJgnDhVbRhlpUA94DWlDQ5ArqVeTU',
    appId: '1:61125461906:web:1ac5060e9dca42c44de34b',
    messagingSenderId: '61125461906',
    projectId: 'flutterauth-593df',
    authDomain: 'flutterauth-593df.firebaseapp.com',
    storageBucket: 'flutterauth-593df.appspot.com',
    measurementId: 'G-W511QCYPRQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlaVKrBxZ-s7X6n_ynfg4syhMyn-Iy0mU',
    appId: '1:61125461906:android:6fb0022d53f88b704de34b',
    messagingSenderId: '61125461906',
    projectId: 'flutterauth-593df',
    storageBucket: 'flutterauth-593df.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCowfcw-9stv5-N9O-iX6KE8CRlEQJJL0Q',
    appId: '1:61125461906:ios:9b74c1e9d23f5cfc4de34b',
    messagingSenderId: '61125461906',
    projectId: 'flutterauth-593df',
    storageBucket: 'flutterauth-593df.appspot.com',
    iosClientId: '61125461906-7ejf6s8o16f1hq6h7mumil0kdis4g8h4.apps.googleusercontent.com',
    iosBundleId: 'com.example.pepcorns',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCowfcw-9stv5-N9O-iX6KE8CRlEQJJL0Q',
    appId: '1:61125461906:ios:9b74c1e9d23f5cfc4de34b',
    messagingSenderId: '61125461906',
    projectId: 'flutterauth-593df',
    storageBucket: 'flutterauth-593df.appspot.com',
    iosClientId: '61125461906-7ejf6s8o16f1hq6h7mumil0kdis4g8h4.apps.googleusercontent.com',
    iosBundleId: 'com.example.pepcorns',
  );
}
