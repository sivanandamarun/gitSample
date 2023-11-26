import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/ToDoProvider.dart';
import 'package:todoapp/screens/Dashboard.dart';
import 'package:todoapp/screens/widgets/CommonTextField.dart';

import '../models/TodoModel.dart';

class AddToDoScreen extends StatelessWidget {
  AddToDoScreen({super.key});

  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: loadBody(context))),
    );
  }

  Widget loadBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextField(titleController: titleController),
          const SizedBox(
            height: 10.0,
          ),
          CommonTextField(titleController: descriptionController),
          ElevatedButton(
              onPressed: () {
                addToDo(
                  context,
                );
              },
              child: const Text('Add')),
        ],
      ),
    );
  }

  void addToDo(BuildContext context) {
    List<TodoModel>? todoList = Provider.of<ToDoProvider>(context , listen: false)
        .addToDo(titleController.text.trim(), descriptionController.text.trim(), 1);
    print(todoList);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  Dashboard(),
      ),
    );
  }
}
