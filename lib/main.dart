import 'package:ar_furniture_app/pages/home_screan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  try {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (errorMsg) {

    print("Error: " + errorMsg.toString());
  }
  // Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: apiKey, 
  //     appId: appId, 
  //     messagingSenderId: messagingSenderId, 
  //     projectId: projectId
  //   )
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScrean(),
    );
  }
}
