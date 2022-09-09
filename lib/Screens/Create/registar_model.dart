import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/base.dart';

import '../../Shered/Conestant/Conestant.dart';
import '../../datebase/database_utils.dart';
import '../../models/my_user.dart';
import 'States.dart';

class RegistarViweModel extends BaseViewModel<States>{


  // null
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  void CreateAccount(String email,String password,String fName,String lName,String username) async{
    String? message=null;
    try {
      Navigatore?.showloding();
      var result=await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      var user=MyUser(id: result.user?.uid??"", fName: fName,
          lName: lName, username: username, email: email);
      var userData= await DateBaseUtils.createDBUser(user);
        Navigatore?.hideloding();
        Navigatore?.goToHome(user);




    } on FirebaseAuthException catch (e) {
      if (e.code == Conestant.WEAKPASSWORD) {
        message='The password provided is too weak.';
      } else if (e.code == Conestant.UESEDEMAIL) {
        message='The account already exists for that email.';
      }

      Navigatore?.hideloding();
      if(message!=null){
        Navigatore?.showmassage(message);
      }
    } catch (e) {
      print(e);
    }
  }
}