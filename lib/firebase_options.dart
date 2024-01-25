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
    apiKey: 'AIzaSyAgkN4A7goAmL0m7cwSPMHwWsw-vnfy6AA',
    appId: '1:893729205850:web:66885fd77ea00eed16b263',
    messagingSenderId: '893729205850',
    projectId: 'bloc-application-90859',
    authDomain: 'bloc-application-90859.firebaseapp.com',
    storageBucket: 'bloc-application-90859.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhifUEnpfdCL_a5lx4VpJbe3I5AvXb4c0',
    appId: '1:893729205850:android:cfa7c610413a6c7816b263',
    messagingSenderId: '893729205850',
    projectId: 'bloc-application-90859',
    storageBucket: 'bloc-application-90859.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0htWbrfYvrFffsgndJRpf5cGR13YPcJ4',
    appId: '1:893729205850:ios:38943c502bd5af9a16b263',
    messagingSenderId: '893729205850',
    projectId: 'bloc-application-90859',
    storageBucket: 'bloc-application-90859.appspot.com',
    iosBundleId: 'com.example.blocApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0htWbrfYvrFffsgndJRpf5cGR13YPcJ4',
    appId: '1:893729205850:ios:ba2bfce87054455816b263',
    messagingSenderId: '893729205850',
    projectId: 'bloc-application-90859',
    storageBucket: 'bloc-application-90859.appspot.com',
    iosBundleId: 'com.example.blocApplication.RunnerTests',
  );
}