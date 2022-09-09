import 'package:untitled1/base.dart';

import '../../models/my_user.dart';

abstract class States extends BaseNavigator{
  void goToHome(MyUser user);
}