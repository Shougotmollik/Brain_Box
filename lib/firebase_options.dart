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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF-CpmGpSdk3eao-sAAjS5sEVTqVpJvsY',
    appId: '1:526083197540:android:814b6dcb2e837409e92d71',
    messagingSenderId: '526083197540',
    projectId: 'brain-box-9dc5f',
    storageBucket: 'brain-box-9dc5f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxmaWdwoTRRUPm3rSWrrVqtkjQutB5fUg',
    appId: '1:526083197540:ios:8c2e666549f3c7f8e92d71',
    messagingSenderId: '526083197540',
    projectId: 'brain-box-9dc5f',
    storageBucket: 'brain-box-9dc5f.firebasestorage.app',
    iosBundleId: 'com.example.brainBox',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQk4QUOL-zaET0G8uwbrEfpeTdkvxj0tQ',
    appId: '1:526083197540:web:5ecda09342646210e92d71',
    messagingSenderId: '526083197540',
    projectId: 'brain-box-9dc5f',
    authDomain: 'brain-box-9dc5f.firebaseapp.com',
    storageBucket: 'brain-box-9dc5f.firebasestorage.app',
  );

}