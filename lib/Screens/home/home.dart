
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Screens/home/room_widget.dart';

import '../../base.dart';
import '../add_rooms/add_room.dart';
import 'home_view_model.dart';
import 'navigator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen,HomeViewModel> implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.Navigatore=this;
    print('___________________________________________________________________________________');
    viewModel.getRooms();
    print('_________________________________________________________________________________________');
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c)=>viewModel,
      child: Stack(children: [
        Container(
          child: Image.asset(
            'assets/images/main_bg.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('Chat App'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, AddRoom.routeName);
            },
            child: Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Consumer<HomeViewModel>(
                    builder: (c,vm,child){
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount:vm.rooms.length
                          ,itemBuilder: (c,index){
                        return
                          RoomWidget(vm.rooms[index]);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }


  @override
  HomeViewModel intichange() =>HomeViewModel();


}
//Text('${vm.rooms[index]}',style: TextStyle(color: Colors.black,fontSize: 50),);