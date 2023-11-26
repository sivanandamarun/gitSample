import 'package:flutter/cupertino.dart';

import '../models/TodoModel.dart';

class ToDoProvider with ChangeNotifier {
  List<TodoModel>? todoList = [];

  List<TodoModel>? get getToDo => todoList;

  List<TodoModel>? addToDo(String title ,String description,int id){
    TodoModel todoModel = TodoModel(title: title, description: description,id: id);
    todoList?.add(todoModel);
    notifyListeners();
    return todoList;
  }

  List<TodoModel>? deleteToDo(int id){
    for(var item in todoList!){
      if(item.id == id){
        todoList?.remove(item);
      }
    }
    notifyListeners();
    return todoList;
  }
}