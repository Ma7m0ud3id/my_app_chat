import 'package:firebase_auth/firebase_auth.dart';

import '../../Shered/Conestant/Conestant.dart';
import '../../base.dart';
import '../Create/States.dart';
import 'Navigat_login.dart';

class RegisterLogin extends BaseViewModel<NavigatLogin>{
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  void Recive(String email,String password)async{
    try {
      Navigatore?.showloding();
      final credential =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
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