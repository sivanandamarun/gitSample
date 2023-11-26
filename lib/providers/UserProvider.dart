import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/UserListDto.dart';
import '../repository/UserRepository.dart';

class UserProvider with ChangeNotifier{
  UserRepository userRepository = UserRepository();
  late AllUsersResponseDto allUserList;

  Future<AllUsersResponseDto?> allUsers() async{
    allUserList = await userRepository.getAllUser();
    notifyListeners();
    return allUserList;
  }

}