import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDlExlpVnXby4PXzG9g9CWfuKQ3OL-8mkQ",
            authDomain: "golftower-2abea.firebaseapp.com",
            projectId: "golftower-2abea",
            storageBucket: "golftower-2abea.appspot.com",
            messagingSenderId: "411228406476",
            appId: "1:411228406476:web:a650bc8e2739a0c5993869",
            measurementId: "G-KTQ3F2QR26"));
  } else {
    await Firebase.initializeApp();
  }
}
