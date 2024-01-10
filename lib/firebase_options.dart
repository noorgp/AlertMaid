
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
   apiKey: 'AIzaSyBSl6azidVT68u2s5xKWSHnupwV3faVhX4',
    appId: '1:138014873080:android:c1e45c5db841fafc2fb20d',
    databaseURL: "https://temptrackerapp-620a4-default-rtdb.firebaseio.com",
    messagingSenderId: '138014873080',
    projectId: 'alerts-maid',
    storageBucket: 'alerts-maid.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSl6azidVT68u2s5xKWSHnupwV3faVhX4',
    appId: '1:138014873080:android:c1e45c5db841fafc2fb20d',
    databaseURL: "https://temptrackerapp-620a4-default-rtdb.firebaseio.com",
    messagingSenderId: '138014873080',
    projectId: 'alerts-maid',
    storageBucket: 'alerts-maid.appspot.com',
  );  

}
