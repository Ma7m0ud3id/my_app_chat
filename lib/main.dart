import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/Screens/Create/Creat_acount.dart';
import 'package:untitled1/Screens/Login_Screen/Login.dart';
import 'package:untitled1/providers/user_provider.dart';

import 'Screens/add_rooms/add_room.dart';
import 'Screens/home/home.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (c) => UserProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute:provider.firebaseUser == null
           ? LoginScreen.routName
           : HomeScreen.routeName,
      routes: {
        Createe.routName:(n)=>Createe(),
        LoginScreen.routName:(v)=>LoginScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        AddRoom.routeName: (c) => AddRoom(),
      },
    );
  }
}


