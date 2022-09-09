import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Screens/Create/States.dart';
import 'package:untitled1/Screens/Create/registar_model.dart';
import 'package:untitled1/Screens/Login_Screen/Login.dart';
import 'package:untitled1/models/my_user.dart';

import '../../base.dart';
import '../../providers/user_provider.dart';
import '../home/home.dart';

class Createe extends StatefulWidget  {
  static const String routName = 'Create';

  @override
  State<Createe> createState() => _CreateState();
}

class _CreateState extends BaseState<Createe,RegistarViweModel> implements States {
  var formKey = GlobalKey<FormState>();

  var fristnamecontroller = TextEditingController();

  var lastnamecontroller = TextEditingController();

  var usernamecontroller = TextEditingController();

  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

//RegistarViweModel registarViweModel=RegistarViweModel();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.Navigatore=this;
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (c)=>viewModel,
      child: Stack(
        children: [
      Container(child: Image.asset('assets/images/main_bg.png',
        fit: BoxFit.fill,height: double.infinity
        ,width: double.infinity,)),
      Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
      centerTitle: true,
      title: Text('Create Acount',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
        child:  Column(

            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

          TextFormField(
            controller: fristnamecontroller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(labelText: 'Frist name',labelStyle:TextStyle(color: Colors.black),),
            validator: (text){
              if(text==null||text.trim().isEmpty){
                return'Enter Last Frist name please';
              }
              return null;
            },
          ),
            TextFormField(
              controller: lastnamecontroller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(labelText: 'Last name',labelStyle:TextStyle(color: Colors.black),),
              validator: (text){
                if(text==null||text.trim().isEmpty){
                  return'Enter Last name please';
              }

                return null;

              },
            ),
            TextFormField(
              controller: usernamecontroller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(labelText: 'User name',labelStyle:TextStyle(color: Colors.black),),
              validator: (text){
                if(text==null||text.trim().isEmpty){
                  return 'Enter Use name please';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailcontroller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(labelText: 'Email name',labelStyle:TextStyle(color: Colors.black),),
              validator: (text){
                if(text==null||text.trim().isEmpty){
                  return'Enter  Email please';
                }
                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                if(emailValid){
                  return null;
                }
                else {
                  return 'Email is not true';
                }
              },
            ),
            TextFormField(
              controller: passwordcontroller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(labelText: 'Password ',labelStyle:TextStyle(color: Colors.black),),
              validator: (text){
                if(text==null||text.trim().isEmpty){
                  return'Enter  Password please';
                }
                if(text.length<6){
                  return 'Password is smaller than 6 char';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: (){
              CreateAccount();
            }, child: Text('Create Acount',style: TextStyle(color: Colors.black),)),
            InkWell(
              onTap: (){
                //,
                  Navigator.pushNamed(context, LoginScreen.routName);
                },
                child: Text('I have an account',style: TextStyle(color: Colors.blue),)),

          ]
          ),
        ),
      ),
      ),

      ],
      ),
    );
    }

  void CreateAccount(){
    if (formKey.currentState!.validate()) {
      viewModel.CreateAccount(emailcontroller.text,passwordcontroller.text,fristnamecontroller.text,
          lastnamecontroller.text,usernamecontroller.text);
    }
  }

  @override
  RegistarViweModel intichange() {
    return RegistarViweModel();
  }

  @override
  void goToHome(MyUser user) {
    var userProvider=Provider.of<UserProvider>(context);
    userProvider.user=user;
    print('_____________________________________________________________________________________________');
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }


}
