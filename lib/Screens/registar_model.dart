import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Shered/Conestant/Conestant.dart';
import 'States.dart';

class RegistarViweModel extends ChangeNotifier{


  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  late States states ;
  void Register(String email,String password)async{

    try {
      states.showloding();
      final credential =  await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      states.hideloding();
    } on FirebaseAuthException catch (e) {
      if (e.code == Conestant.WEAKPASSWORD) {
        states.hideloding();
        states.showmassage('The password provided is too weak.');

      } else if (e.code == Conestant.UESEDEMAIL) {
        states.hideloding();
        states.showmassage('The account already exists for that email.');

      }
    } catch (e) {
      print(e);
    }
  }
}