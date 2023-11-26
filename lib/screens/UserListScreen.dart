import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/UserProvider.dart';

import '../models/UserListDto.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});

  // late AllUsersResponseDto? allUserList;
  late List<Datum> userList =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: loadBody(context)),
    );
  }

  Widget loadBody(BuildContext context) {
    return  Consumer<UserProvider>(
      builder: (context,providerData,child) {
        providerData.allUsers().then((value) {
          AllUsersResponseDto? allUserList = value;
          userList = allUserList!.data;
        });
        return SizedBox(
          height: 500.0,
          child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userList!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(userList![index].firstName),
                    );
                  },
                ),
        );
      }
    );
  }
}
