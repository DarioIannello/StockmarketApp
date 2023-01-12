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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDD5AfFY-7XtGvhUnnx4_XuOFM1z9t9xbI',
    appId: '1:393732582629:web:0e78a9a7c90ba15ad2380c',
    messagingSenderId: '393732582629',
    projectId: 'stockapp-ce3b3',
    authDomain: 'stockapp-ce3b3.firebaseapp.com',
    storageBucket: 'stockapp-ce3b3.appspot.com',
    measurementId: 'G-76GC9C33G1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAd44LiiCSKGpVoCI0CHV-OUN-kH9ULAOQ',
    appId: '1:393732582629:android:594741ac520e9e6dd2380c',
    messagingSenderId: '393732582629',
    projectId: 'stockapp-ce3b3',
    storageBucket: 'stockapp-ce3b3.appspot.com',
  );
}