import 'package:bloc_one/widgets/bloc_provider.dart';
import 'package:bloc_one/models/user.dart';
import 'dart:async';
import 'package:bloc_one/api/db_api.dart';

class UserBloc implements BlocBase {
  User _user;

  /// broadcast() let stream be listened to by multiple listeners
  StreamController<User> _userController = StreamController<User>.broadcast();
  Sink<User> get _inUser => _userController.sink;
  Stream<User> get outUser => _userController.stream;

  /// Handling Actions on entity [User]
  StreamController<User> _updateUserController = StreamController<User>();
  Sink<User> get updateUser => _updateUserController.sink;

  /// Convinience Stream to update [User] name
  StreamController<String> _updateNameController = StreamController<String>();
  Sink<String> get updateName => _updateNameController.sink;

  UserBloc() {
    api.getUser().then((user) {
      _user = user;
      _inUser.add(_user);
    });
    _updateUserController.stream.listen(_updateUser);
    _updateNameController.stream.listen(_updateName);
  }

  void _updateUser(User user) {
    _user = user;
    _inUser.add(_user);
  }

  void _updateName(String name) {
    _user.name = name;
    _inUser.add(_user);
  }

  @override
  void dispose() {
    _userController.close();
    _updateUserController.close();
    _updateNameController.close();
  }
}
