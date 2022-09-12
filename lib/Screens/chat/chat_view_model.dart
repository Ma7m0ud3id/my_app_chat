
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../base.dart';
import '../../datebase/database_utils.dart';
import '../../models/message.dart';
import '../../models/my_user.dart';
import '../../models/room.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator>{


  late Room room;
  late MyUser currentUser;

  void AddMessageToChat(String messageContent)async{

    Message message= Message(roomId: room.id,
        content: messageContent,
        dateTime: DateTime.now().microsecondsSinceEpoch
        , SenderId: currentUser.id,
        SenderName: currentUser.username);
    try{
      var res= await DateBaseUtils.InsertMessageToFireStore(message);
      Navigatore?.clearForm();
    }catch (e){
      Navigatore?.showmassage(e.toString());
    }

  }

  Stream<QuerySnapshot<Message>> listenToUpdatesMessages(){

    return  DateBaseUtils.getMessageStreams(room.id);

  }

}

abstract class ChatNavigator extends BaseNavigator{


  void clearForm();
}