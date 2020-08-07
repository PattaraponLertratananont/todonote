import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todonote/models.dart';

class ListTodo extends StatefulWidget {
  final TodoNote todo;
  const ListTodo({Key key, this.todo}) : super(key: key);

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  TodoNote _todo;
  bool isDone;
  Timer time;

  @override
  void initState() {
    _todo = widget.todo;
    isDone = _todo.isDone;
    print(_todo.toJson());
    super.initState();
  }

  @override
  void dispose() {
    time?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_todo.uuid),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            activeColor: Theme.of(context).primaryColor,
            value: isDone,
            onChanged: (value) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                isDone = value;
                prefs.setString(
                  _todo.uuid,
                  jsonEncode(
                    {
                      'uuid': _todo.uuid,
                      'isDone': value,
                      'topic': _todo.topic,
                      'task': _todo.task,
                    },
                  ),
                );
              });
            },
          ),
          title: Text(_todo.topic),
        ),
      ),
      background: Container(),
      secondaryBackground: Container(
        color: Colors.red[400],
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 5),
            content: Text('delete ${_todo.topic}'),
            backgroundColor: Colors.red[400],
            action: SnackBarAction(
              label: 'reset',
              textColor: Colors.white,
              onPressed: () {
                time.cancel();
                Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ),
        );
        time = Timer(Duration(seconds: 5), () {
          prefs.remove(_todo.uuid);
        });
      },
    );
  }
}
