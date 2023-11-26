import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Add title',
      ),
    );
  }
}
