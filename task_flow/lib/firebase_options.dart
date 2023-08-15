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
    apiKey: 'AIzaSyAVIDQZLM-_pbDzN8KpEKJxjy3mcxyxQIo',
    appId: '1:222250741935:web:982de31c730984f10da45a',
    messagingSenderId: '222250741935',
    projectId: 'task-flow-416a0',
    authDomain: 'task-flow-416a0.firebaseapp.com',
    storageBucket: 'task-flow-416a0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuOCu7TnpQGK-59mPhPcTTv1sbduzzZs0',
    appId: '1:222250741935:android:22b40311b29d31fa0da45a',
    messagingSenderId: '222250741935',
    projectId: 'task-flow-416a0',
    storageBucket: 'task-flow-416a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8ptupe1fY8UeN7h6zVl6yoSA2VF9IHh8',
    appId: '1:222250741935:ios:f379b051c312f77c0da45a',
    messagingSenderId: '222250741935',
    projectId: 'task-flow-416a0',
    storageBucket: 'task-flow-416a0.appspot.com',
    iosClientId: '222250741935-s9kuigdt5l43gbjqkc0fnqb879lt9k6j.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskFlow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8ptupe1fY8UeN7h6zVl6yoSA2VF9IHh8',
    appId: '1:222250741935:ios:eeb063c06ff89ecb0da45a',
    messagingSenderId: '222250741935',
    projectId: 'task-flow-416a0',
    storageBucket: 'task-flow-416a0.appspot.com',
    iosClientId: '222250741935-tbmb9n194vqft4otn6cvtui6547uiqf4.apps.googleusercontent.com',
    iosBundleId: 'com.example.taskFlow.RunnerTests',
  );
}
