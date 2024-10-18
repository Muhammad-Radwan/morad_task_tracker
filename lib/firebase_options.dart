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
    apiKey: 'AIzaSyBpzjfrTgxO1wXqkQqnipXiyPAwOBeEJgM',
    appId: '1:125588976484:web:5d03d1dd2c64efdea18071',
    messagingSenderId: '125588976484',
    projectId: 'tasktracker-42a23',
    authDomain: 'tasktracker-42a23.firebaseapp.com',
    storageBucket: 'tasktracker-42a23.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZOj81Jlo4B9coCJy4YBB9oIR64U5iczk',
    appId: '1:125588976484:android:a8e584f73b7e2d68a18071',
    messagingSenderId: '125588976484',
    projectId: 'tasktracker-42a23',
    storageBucket: 'tasktracker-42a23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDT6nV9_xcWIbSggHyUO8fY7usQI7mQO4U',
    appId: '1:125588976484:ios:e7170d0d8e4fc809a18071',
    messagingSenderId: '125588976484',
    projectId: 'tasktracker-42a23',
    storageBucket: 'tasktracker-42a23.appspot.com',
    iosBundleId: 'com.example.moradTaskTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDT6nV9_xcWIbSggHyUO8fY7usQI7mQO4U',
    appId: '1:125588976484:ios:e7170d0d8e4fc809a18071',
    messagingSenderId: '125588976484',
    projectId: 'tasktracker-42a23',
    storageBucket: 'tasktracker-42a23.appspot.com',
    iosBundleId: 'com.example.moradTaskTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBpzjfrTgxO1wXqkQqnipXiyPAwOBeEJgM',
    appId: '1:125588976484:web:c4c7bcb82a26dcf3a18071',
    messagingSenderId: '125588976484',
    projectId: 'tasktracker-42a23',
    authDomain: 'tasktracker-42a23.firebaseapp.com',
    storageBucket: 'tasktracker-42a23.appspot.com',
  );
}
