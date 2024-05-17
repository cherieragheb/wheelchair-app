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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB7xb71dizJ5DB02dCq-0UC4XpyvQ5GTaA',
    appId: '1:856159646097:web:b51c1eb2d5fd301a4dea30',
    messagingSenderId: '856159646097',
    projectId: 'tom-flutter',
    authDomain: 'tom-flutter.firebaseapp.com',
    storageBucket: 'tom-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpXhr7yCvxWWgAgNp1IJ8iExv20lgBPmk',
    appId: '1:856159646097:android:a5a3e062a6f4eb9b4dea30',
    messagingSenderId: '856159646097',
    projectId: 'tom-flutter',
    storageBucket: 'tom-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAV8P5KR1WyiH9iI18g0gHSgmlgfzSKrgQ',
    appId: '1:856159646097:ios:d17d1db8b974a9af4dea30',
    messagingSenderId: '856159646097',
    projectId: 'tom-flutter',
    storageBucket: 'tom-flutter.appspot.com',
    iosBundleId: 'com.example.tom',
  );

}