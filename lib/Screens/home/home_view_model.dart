

import '../../base.dart';
import '../../datebase/database_utils.dart';
import '../../models/room.dart';
import 'navigator.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator>{

  List<Room> rooms=[];

  void getRooms()async{
    rooms= await DateBaseUtils.getRoomsFromFireStore();
    print(rooms);
  }

}