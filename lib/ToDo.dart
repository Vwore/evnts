import 'package:flutter/material.dart';
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do list',
        ),
        centerTitle: true,

      ),
      body: ListView.builder(
        // itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('test'),
          );
        },
      ),


    );
  }
}

