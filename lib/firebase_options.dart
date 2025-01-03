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
    apiKey: 'AIzaSyBsMrqSnh5sQYH8rP_0I7Bg36uqom0enJU',
    appId: '1:351714892389:web:1c89721514257bf71dc48c',
    messagingSenderId: '351714892389',
    projectId: 'rvwauth',
    authDomain: 'rvwauth.firebaseapp.com',
    storageBucket: 'rvwauth.appspot.com',
    measurementId: 'G-QT0BN7XY4G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVMUk8K1InB-dcOi0CUfY_v4Xf1WMwNSo',
    appId: '1:351714892389:android:8a39c4417de60c221dc48c',
    messagingSenderId: '351714892389',
    projectId: 'rvwauth',
    storageBucket: 'rvwauth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbvGimymHeTYWzgCIBKPmFBebs6IKzs-0',
    appId: '1:351714892389:ios:0e61e1df610aa72e1dc48c',
    messagingSenderId: '351714892389',
    projectId: 'rvwauth',
    storageBucket: 'rvwauth.appspot.com',
    iosClientId: '351714892389-ki4e885iqhfj8agm3k42pa7ud2r8utjq.apps.googleusercontent.com',
    iosBundleId: 'com.eemwco.rvw',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbvGimymHeTYWzgCIBKPmFBebs6IKzs-0',
    appId: '1:351714892389:ios:0e61e1df610aa72e1dc48c',
    messagingSenderId: '351714892389',
    projectId: 'rvwauth',
    storageBucket: 'rvwauth.appspot.com',
    iosClientId: '351714892389-ki4e885iqhfj8agm3k42pa7ud2r8utjq.apps.googleusercontent.com',
    iosBundleId: 'com.eemwco.rvw',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBsMrqSnh5sQYH8rP_0I7Bg36uqom0enJU',
    appId: '1:351714892389:web:642b663bbb915c751dc48c',
    messagingSenderId: '351714892389',
    projectId: 'rvwauth',
    authDomain: 'rvwauth.firebaseapp.com',
    storageBucket: 'rvwauth.appspot.com',
    measurementId: 'G-DJ0WYHYH3F',
  );
}
