import 'package:flutter/material.dart';

class ListTodo extends StatefulWidget {
  final bool isDone;
  final String toppic;
  const ListTodo({Key key, this.isDone, this.toppic}) : super(key: key);

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
          value: isDone,
          onChanged: (value) {
            setState(() {
              isDone = value;
            });
          },
        ),
        title: Text(widget.toppic),
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
