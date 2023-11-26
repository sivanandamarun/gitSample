import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/ToDoProvider.dart';

import '../models/TodoModel.dart';
import 'AddToDoScreen.dart';
import 'UserListScreen.dart';

class Dashboard extends StatelessWidget {
   Dashboard({super.key});

  late List<TodoModel>? todoList = [];

  @override
  Widget build(BuildContext context) {
    todoList = Provider.of<ToDoProvider>(context,listen: false).getToDo;
    return Scaffold(
      persistentFooterButtons: [
        Center(
          child: TextButton(
              style: const ButtonStyle(),
              onPressed: () {
                callUserScreen(context);
              },
              child: const Text("user Details List")),
        )
      ],
      body: SafeArea(child: loadBody(context)),
    );
  }

  Widget loadBody(BuildContext context) {
    return todoList!.isEmpty ? loadAddTodo(context) :
    SizedBox(
      height: 500,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: todoList?.length,
        itemBuilder: (context, index) {
          return ListTile(
            subtitle:Text(todoList![index].description,style: const TextStyle(color: Colors.black,fontSize: 16),),
            title: Text(todoList![index].title,style: const TextStyle(color: Colors.black,fontSize: 16),),
          );
        },
      ),
    );
  }

  Widget loadAddTodo(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            callAddToDoScreen(context);
          },
          child: const Text('Add todo')),
    );
  }

  void callAddToDoScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddToDoScreen(),
    ));
  }

  void callUserScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UserListScreen(),));
  }
}
