import 'package:flutter/material.dart';

class ListTodo extends StatefulWidget {
  final bool isDone;
  final String topic;
  const ListTodo({Key key, this.isDone, this.topic}) : super(key: key);

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  bool isDone;
  @override
  void initState() {
    isDone = widget.isDone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: isDone,
          onChanged: (value) {
            setState(() {
              isDone = value;
            });
          },
        ),
        title: Text(widget.topic),
        trailing: IconButton(
          splashRadius: 20.0,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
