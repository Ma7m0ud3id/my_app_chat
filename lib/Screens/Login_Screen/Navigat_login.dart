import '../../base.dart';
import '../../models/my_user.dart';

abstract class NavigatLogin extends BaseNavigator{
  void goToHome(MyUser user);
}