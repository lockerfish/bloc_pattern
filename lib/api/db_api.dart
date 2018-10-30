import 'package:bloc_one/models/user.dart';

class DbApi {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 1));
    User _user = User('Kayla', 11, 90.0);
    return _user;
  }
}

DbApi api = DbApi();
