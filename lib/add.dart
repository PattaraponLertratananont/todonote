import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add Note'),
      // ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.12,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Add Note',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
