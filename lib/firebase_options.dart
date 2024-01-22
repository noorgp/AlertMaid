
import 'package:firebase_core/firebase_core.dart';
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
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   return macos;
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
   apiKey: 'AIzaSyAYeRrZXWwa70H3iKUr3aoWlOoj3Hh2AXU',
    appId: '1:917399860311:android:5587218369072dc233df12',
    databaseURL: "https://alerts-maid-dbc5c-default-rtdb.asia-southeast1.firebasedatabase.app",
    messagingSenderId: '917399860311',
    projectId: 'alerts-maid-dbc5c',
    storageBucket: 'alerts-maid-dbc5c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYeRrZXWwa70H3iKUr3aoWlOoj3Hh2AXU',
    appId: '1:917399860311:android:5587218369072dc233df12',
    databaseURL: "https://alerts-maid-dbc5c-default-rtdb.asia-southeast1.firebasedatabase.app",
    messagingSenderId: '917399860311',
    projectId: 'alerts-maid-dbc5c',
    storageBucket: 'alerts-maid-dbc5c.appspot.com',
  );  

}
