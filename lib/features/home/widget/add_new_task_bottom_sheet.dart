import 'package:flutter/material.dart';

class AddNewTaskBottomSheet extends StatelessWidget {

  final Function(String) onSave;

  AddNewTaskBottomSheet({required this.onSave, Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        TextButton(onPressed: () {
          onSave(_controller.text);
          Navigator.of(context).pop();
        }, child: const Text('Save', style: TextStyle(color: Colors.white),))
      ],
      title: const Text('Create new Task'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Add description'
            ),
          )
        ],
      ),
    ),
  );
}
