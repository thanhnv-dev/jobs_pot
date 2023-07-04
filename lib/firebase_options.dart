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
    apiKey: 'AIzaSyDxSPdEQiGihTzXBsMh7AwH5VpeWoHICFI',
    appId: '1:178268151172:web:1bb89702e53b6ffd4b91d1',
    messagingSenderId: '178268151172',
    projectId: 'jobs-pot-6f2b3',
    authDomain: 'jobs-pot-6f2b3.firebaseapp.com',
    storageBucket: 'jobs-pot-6f2b3.appspot.com',
    measurementId: 'G-XGN9S01FK7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVdpzoRGxelqZHhzYYryToNL353EgPcBg',
    appId: '1:178268151172:android:00c144e9dbe2b1e84b91d1',
    messagingSenderId: '178268151172',
    projectId: 'jobs-pot-6f2b3',
    storageBucket: 'jobs-pot-6f2b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaFKRR_jHQhiF05qypUeK8NPRK5KqyyZM',
    appId: '1:178268151172:ios:d5e1feb4ee6ae9b74b91d1',
    messagingSenderId: '178268151172',
    projectId: 'jobs-pot-6f2b3',
    storageBucket: 'jobs-pot-6f2b3.appspot.com',
    androidClientId: '178268151172-fnq1v9cml8v4id697dpttjrdnkoeatk1.apps.googleusercontent.com',
    iosClientId: '178268151172-tk1hsakgu52j3l5sb4vr19tpdl78qgca.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobsPot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaFKRR_jHQhiF05qypUeK8NPRK5KqyyZM',
    appId: '1:178268151172:ios:f0f50914d671ea6b4b91d1',
    messagingSenderId: '178268151172',
    projectId: 'jobs-pot-6f2b3',
    storageBucket: 'jobs-pot-6f2b3.appspot.com',
    androidClientId: '178268151172-fnq1v9cml8v4id697dpttjrdnkoeatk1.apps.googleusercontent.com',
    iosClientId: '178268151172-tkn05hvsi6367ld1s8t1743o31okiov2.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobsPot.RunnerTests',
  );
}
