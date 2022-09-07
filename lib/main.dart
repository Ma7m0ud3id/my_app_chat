import 'package:flutter/material.dart';
import 'package:untitled1/Screens/Create/Creat_acount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/Screens/Login_Screen/Login.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute:Create.routName ,
      routes: {
        Create.routName:(c)=>Create(),
        LoginScreen.routName:(v)=>LoginScreen(),
      },
    );
  }
}


