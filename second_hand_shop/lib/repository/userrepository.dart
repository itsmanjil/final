import 'package:second_hand_shop/api/userapi.dart';
import 'package:second_hand_shop/model/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> login(String username, String password) {
    return UserAPI().login(username, password);
  }
}
