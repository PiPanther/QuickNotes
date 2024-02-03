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
    apiKey: 'AIzaSyAWoX4DZPL8PWek1yl7i_dfNO-mAd_D-44',
    appId: '1:906422631837:web:4b435772dd337c7939c374',
    messagingSenderId: '906422631837',
    projectId: 'notesapp-3782e',
    authDomain: 'notesapp-3782e.firebaseapp.com',
    storageBucket: 'notesapp-3782e.appspot.com',
    measurementId: 'G-JY5GYBB9HX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtKwFe_sUDkEvKfV9THfOqzca51M0sC3I',
    appId: '1:906422631837:android:c5cb315c59a04e3739c374',
    messagingSenderId: '906422631837',
    projectId: 'notesapp-3782e',
    storageBucket: 'notesapp-3782e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_rB8Z8xsJ-xcs5oWuI_wTgaDV3MpQI0Q',
    appId: '1:906422631837:ios:9b8e5feb923d3a9239c374',
    messagingSenderId: '906422631837',
    projectId: 'notesapp-3782e',
    storageBucket: 'notesapp-3782e.appspot.com',
    iosBundleId: 'com.example.quicknotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_rB8Z8xsJ-xcs5oWuI_wTgaDV3MpQI0Q',
    appId: '1:906422631837:ios:459cb99aa623e44139c374',
    messagingSenderId: '906422631837',
    projectId: 'notesapp-3782e',
    storageBucket: 'notesapp-3782e.appspot.com',
    iosBundleId: 'com.example.quicknotes.RunnerTests',
  );
}
