import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCJYew59nJv3ltuSC02UoOluEQwImiZgtc",
            authDomain: "legendofenglishbasic.firebaseapp.com",
            projectId: "legendofenglishbasic",
            storageBucket: "legendofenglishbasic.appspot.com",
            messagingSenderId: "399564176676",
            appId: "1:399564176676:web:ae7c2e6bc0d6e1377e07b1",
            measurementId: "G-JH67ZRX0ET"));
  } else {
    await Firebase.initializeApp();
  }
}
