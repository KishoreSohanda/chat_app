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
    apiKey: 'AIzaSyBxFRLejCF5QHeWtS98z_jqLApNXumjtKc',
    appId: '1:618695953125:web:b021e9f75f2db94328e20c',
    messagingSenderId: '618695953125',
    projectId: 'flutter-chatapp-47211',
    authDomain: 'flutter-chatapp-47211.firebaseapp.com',
    storageBucket: 'flutter-chatapp-47211.appspot.com',
    measurementId: 'G-XE3YRR922N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC49s_QYxAJmMAAA3w_rdPy4ysdHPqgb7s',
    appId: '1:618695953125:android:802cd1b69c0e34f328e20c',
    messagingSenderId: '618695953125',
    projectId: 'flutter-chatapp-47211',
    storageBucket: 'flutter-chatapp-47211.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoeJZMQA-bxfYNUn43sobSOGwZqDo0xKg',
    appId: '1:618695953125:ios:4f293b098897226c28e20c',
    messagingSenderId: '618695953125',
    projectId: 'flutter-chatapp-47211',
    storageBucket: 'flutter-chatapp-47211.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoeJZMQA-bxfYNUn43sobSOGwZqDo0xKg',
    appId: '1:618695953125:ios:316c13982185806f28e20c',
    messagingSenderId: '618695953125',
    projectId: 'flutter-chatapp-47211',
    storageBucket: 'flutter-chatapp-47211.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
