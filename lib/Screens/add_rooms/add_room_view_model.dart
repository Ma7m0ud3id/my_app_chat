
import 'package:untitled1/Screens/add_rooms/room_navigator.dart';

import '../../base.dart';
import '../../datebase/database_utils.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator>{



  void createRoom(String title,String catId,String desc)async{
    Navigatore?.showloding();
    String? message=null;
    try{
      var result=await DateBaseUtils.createRoom(title, catId, desc);

    }catch(e){
      message=e.toString();
      message='something went wrong';
    }
    Navigatore?.hideloding();
    if(message!=null){
      Navigatore?.showmassage(message);
    }else{
      Navigatore?.roomCreated();
    }

  }

}