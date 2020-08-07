import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 30,
                    ),
                    child: Text('Topic'),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 24,
                      right: 24,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 24,
                      left: 30,
                    ),
                    child: Text('Task'),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 24,
                      right: 24,
                    ),
                    child: TextFormField(
                      maxLines: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Save'), Icon(Icons.chevron_right)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
