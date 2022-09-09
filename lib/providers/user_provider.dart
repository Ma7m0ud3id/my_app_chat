


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../datebase/database_utils.dart';
import '../models/my_user.dart';

class UserProvider extends ChangeNotifier{
  MyUser? user;
  User? firebaseUser;

  UserProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    initMyUser();
  }
  initMyUser()async{
    if(firebaseUser !=null){
      user= await DateBaseUtils.readUser(firebaseUser?.uid??"");
    }
  }


}