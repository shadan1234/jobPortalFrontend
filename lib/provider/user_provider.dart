
import 'package:flutter/material.dart';
import 'package:job_portal_frontend/models/user.dart';


class UserProvider extends ChangeNotifier{
  User _user=User(id: '', name: '', password: '', email: '', applicationList: [], roles: []);
  User get user=>_user;

  void setUserFromMap(Map<String,dynamic>user){
    _user=User.fromMap(user);
    notifyListeners();
  }
  void setUser(String user){
    _user=User.fromJson(user);
    notifyListeners();
  }
  void setUserFromModel(User user){
    _user=user;
    notifyListeners();
  }
}