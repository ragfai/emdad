// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCBBC29MOBmWWMgJL0w76y11XK3vsZVqAo',
    appId: '1:1086736804471:web:fe1eaa8ecf68b8eb41f472',
    messagingSenderId: '1086736804471',
    projectId: 'emdad-94ee5',
    authDomain: 'emdad-94ee5.firebaseapp.com',
    storageBucket: 'emdad-94ee5.firebasestorage.app',
    measurementId: 'G-BYQKZFBWJR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9HpTB9TJOlWUzR2K88uvGNeg4W9alFUw',
    appId: '1:1086736804471:android:e25e8c624e3bb5d441f472',
    messagingSenderId: '1086736804471',
    projectId: 'emdad-94ee5',
    storageBucket: 'emdad-94ee5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBqJNSYKmX8aWB95W8YFoIFxmQMzDVtNY',
    appId: '1:1086736804471:ios:82f5255e9ff8adc341f472',
    messagingSenderId: '1086736804471',
    projectId: 'emdad-94ee5',
    storageBucket: 'emdad-94ee5.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBqJNSYKmX8aWB95W8YFoIFxmQMzDVtNY',
    appId: '1:1086736804471:ios:82f5255e9ff8adc341f472',
    messagingSenderId: '1086736804471',
    projectId: 'emdad-94ee5',
    storageBucket: 'emdad-94ee5.firebasestorage.app',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCBBC29MOBmWWMgJL0w76y11XK3vsZVqAo',
    appId: '1:1086736804471:web:64c105c37dfe909d41f472',
    messagingSenderId: '1086736804471',
    projectId: 'emdad-94ee5',
    authDomain: 'emdad-94ee5.firebaseapp.com',
    storageBucket: 'emdad-94ee5.firebasestorage.app',
    measurementId: 'G-72RXRQ4JSL',
  );
}
