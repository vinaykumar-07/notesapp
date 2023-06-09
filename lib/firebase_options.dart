import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

 
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
    apiKey: 'AIzaSyA6wKdtel8KaVw3UcG_VJ6gfBJylW9QV6Q',
    appId: '1:392557821399:web:3fa0f88fe975bc04c55f92',
    messagingSenderId: '392557821399',
    projectId: 'vinay-app-f709a',
    authDomain: 'vinay-app-f709a.firebaseapp.com',
    storageBucket: 'vinay-app-f709a.appspot.com',
    measurementId: 'G-SHJ7RXB916',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5H6im4B6r0PkWVNjtdT6W8bG86xWE504',
    appId: '1:392557821399:android:a7d07ef1316e18aac55f92',
    messagingSenderId: '392557821399',
    projectId: 'vinay-app-f709a',
    storageBucket: 'vinay-app-f709a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANJN1Y0mOEuMeRiklIXG4kc4EzhBGfJho',
    appId: '1:392557821399:ios:9a6cea2f1495e2cfc55f92',
    messagingSenderId: '392557821399',
    projectId: 'vinay-app-f709a',
    storageBucket: 'vinay-app-f709a.appspot.com',
    iosClientId: '392557821399-rek9gtka6jim1gk2mq9kesdcarbf1jhb.apps.googleusercontent.com',
    iosBundleId: 'com.example.vinayApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANJN1Y0mOEuMeRiklIXG4kc4EzhBGfJho',
    appId: '1:392557821399:ios:9a6cea2f1495e2cfc55f92',
    messagingSenderId: '392557821399',
    projectId: 'vinay-app-f709a',
    storageBucket: 'vinay-app-f709a.appspot.com',
    iosClientId: '392557821399-rek9gtka6jim1gk2mq9kesdcarbf1jhb.apps.googleusercontent.com',
    iosBundleId: 'com.example.vinayApp',
  );
}
