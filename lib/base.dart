import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Screens/Create/States.dart';

class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  T? Navigatore = null;
}

abstract class BaseNavigator {
  void showloding();

  void showmassage(String text);

  void hideloding();
}

abstract class BaseState<T extends StatefulWidget, MV extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late MV viewModel;

  MV intichange();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = intichange();
  }

  @override
  void hideloding() {
    Navigator.pop(context);
  }

  @override
  void showloding() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  void showmassage(String text,
      {String? actionName, VoidCallback? voidCallback}) {
    List<Widget> actions = [];
    if (actionName != null) {
      actions.add(TextButton(onPressed: voidCallback, child: Text(actionName)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                Expanded(
                    child: Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ))
              ],
            ),
          );
        });
  }
}
