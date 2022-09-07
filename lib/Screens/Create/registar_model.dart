import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/base.dart';

import '../../Shered/Conestant/Conestant.dart';
import 'States.dart';

class RegistarViweModel extends BaseViewModel<States>{


  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  //late States states ;
  void Register(String email,String password)async{

    try {
      Navigatore?.showloding();
      final credential =  await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      Navigatore?.hideloding();
    } on FirebaseAuthException catch (e) {
      if (e.code == Conestant.WEAKPASSWORD) {
        Navigatore?.hideloding();
        Navigatore?.showmassage('The password provided is too weak.');

      } else if (e.code == Conestant.UESEDEMAIL) {
        Navigatore?.hideloding();
        Navigatore?.showmassage('The account already exists for that email.');

      }
    } catch (e) {
      print(e);
    }
  }
}