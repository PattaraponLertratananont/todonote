import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _controllerTopic = new TextEditingController();
  final TextEditingController _controllerTask = new TextEditingController();
  final _fromkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Form(
                key: _fromkey,
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
                            controller: _controllerTopic,
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
                            controller: _controllerTask,
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Save'),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          if (_controllerTopic.text.isEmpty || _controllerTask.text.isEmpty) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Topic or Task is empty.'),
                                backgroundColor: Colors.red[400],
                                duration: Duration(seconds: 3),
                              ),
                            );
                          } else {
                            String uuid = Uuid().v1();
                            prefs
                                .setString(
                                  uuid,
                                  jsonEncode({
                                    'uuid': uuid,
                                    'isDone': false,
                                    'topic': _controllerTopic.text,
                                    'task': _controllerTask.text,
                                  }),
                                )
                                .whenComplete(() => Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
