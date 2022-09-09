import 'package:firebase_auth/firebase_auth.dart';

import '../../Shered/Conestant/Conestant.dart';
import '../../base.dart';
import '../../datebase/database_utils.dart';
import '../Create/States.dart';
import 'Navigat_login.dart';

class RegisterLogin extends BaseViewModel<NavigatLogin>{


  var firebaseAuth=FirebaseAuth.instance;

  void login(String email,String password)async{
    String? message=null;
    try {
      Navigatore?.showloding();
      var result=await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      var user=await DateBaseUtils.readUser(result.user?.uid??"");

      if(user ==null){
        message='Failed to complete sign in , please try again later..';
      }else{
        Navigatore?.hideloding();
        Navigatore?.goToHome(user);

      }
    } on FirebaseAuthException catch (e) {
      if (e.code == Conestant.USERNOTFOUND) {
        message='No user found for that email.';
      } else if (e.code == Conestant.WRONGPASS) {
        message='Wrong password provided for that user.';
      }
      if (e.code == Conestant.WEAKPASSWORD) {
        message='The password provided is too weak.';
      } else if (e.code == Conestant.UESEDEMAIL) {
        message='The account already exists for that email.';
      }
      Navigatore?.hideloding();
      if(message !=null){
        Navigatore?.showmassage(message);
      }
    } catch (e) {
      print(e);
    }
  }
}