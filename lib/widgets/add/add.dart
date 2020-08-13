import 'dart:convert';

import 'package:flutter_picker/flutter_picker.dart';
// import 'package:todonote/models.dart';
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
  final TextEditingController _controllerTextTag = new TextEditingController(text: 'Text');

  var _customTagIcon = Icons.add.codePoint;
  String f = 'work';
  List _listTag = [
    {
      'name': "Work",
      'isSelected': false,
      'icon': Icons.work.codePoint,
    },
    {
      'name': "Learn",
      'isSelected': false,
      'icon': Icons.book.codePoint,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

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
                            maxLines: 16,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 24,
                            left: 30,
                          ),
                          child: Text('Tag'),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    right: 16,
                                  ),
                                  child: ActionChip(
                                    backgroundColor: Colors.grey[200],
                                    pressElevation: 3,
                                    avatar: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    label: Text(
                                      'Add Tag',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    onPressed: () async {
                                      _customTagIcon = Icons.add.codePoint;
                                      _controllerTextTag.text = "Text";
                                      await showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Custom Tag'),
                                            content: StatefulBuilder(
                                              builder: (BuildContext context, setState) {
                                                return Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      FilterChip(
                                                        avatar: Icon(IconData(_customTagIcon, fontFamily: 'MaterialIcons'), color: Colors.white),
                                                        label: Text(_controllerTextTag.text, style: TextStyle(color: Colors.white)),
                                                        selectedColor: Theme.of(context).primaryColor,
                                                        pressElevation: 0,
                                                        avatarBorder: null,
                                                        selected: true,
                                                        showCheckmark: false,
                                                        padding: EdgeInsets.only(left: 6, right: 6),
                                                        onSelected: (value) => null,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          FlatButton(
                                                            child: Text('Icon'),
                                                            onPressed: () {
                                                              Picker(
                                                                adapter: PickerDataAdapter(
                                                                  data: [
                                                                    PickerItem(
                                                                      text: Icon(Icons.home),
                                                                      children: [
                                                                        PickerItem(text: Icon(Icons.home), value: Icons.home),
                                                                        PickerItem(text: Icon(Icons.home_filled), value: Icons.home_filled),
                                                                        PickerItem(text: Icon(Icons.home_outlined), value: Icons.home_outlined),
                                                                      ],
                                                                    ),
                                                                    PickerItem(
                                                                      text: Icon(Icons.home_repair_service),
                                                                      children: [
                                                                        PickerItem(
                                                                            text: Icon(Icons.home_repair_service), value: Icons.home_repair_service),
                                                                        PickerItem(
                                                                            text: Icon(Icons.home_repair_service_rounded),
                                                                            value: Icons.home_repair_service_rounded),
                                                                        PickerItem(
                                                                            text: Icon(Icons.home_repair_service_sharp),
                                                                            value: Icons.home_repair_service_sharp),
                                                                        PickerItem(
                                                                            text: Icon(Icons.home_repair_service_outlined),
                                                                            value: Icons.home_repair_service_outlined),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                onConfirm: (picker, selecteds) {
                                                                  setState(() {
                                                                    IconData ic = picker.getSelectedValues()[1];
                                                                    _customTagIcon = ic.codePoint;
                                                                  });
                                                                },
                                                              ).showModal(context);
                                                            },
                                                          ),
                                                          FlatButton(
                                                            child: Text('Text'),
                                                            onPressed: () {
                                                              showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                  return AlertDialog(
                                                                    content: Container(
                                                                      child: TextFormField(
                                                                        controller: _controllerTextTag,
                                                                        decoration: InputDecoration(labelText: 'Text'),
                                                                        onChanged: (value) => setState(() {}),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            actions: [
                                              FlatButton(
                                                child: Text('Submit'),
                                                onPressed: () {
                                                  setState(() {
                                                    _listTag.insert(0, {
                                                      'name': _controllerTextTag.text,
                                                      'isSelected': true,
                                                      'icon': _customTagIcon,
                                                    });
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  children: _listTag.map((data) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        right: 16,
                                      ),
                                      child: ActionChip(
                                        avatar: data['isSelected']
                                            ? data['icon'] != null
                                                ? Icon(
                                                    IconData(data['icon'], fontFamily: 'MaterialIcons'),
                                                    color: Colors.white,
                                                    size: 16,
                                                  )
                                                : null
                                            : null,
                                        backgroundColor: data['isSelected'] ? Theme.of(context).primaryColor : Colors.grey[200],
                                        label: Text(
                                          data['name'],
                                          style: TextStyle(
                                            color: data['isSelected'] ? Colors.white : Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        pressElevation: 0,
                                        onPressed: () {
                                          setState(() {
                                            data['isSelected'] = !data['isSelected'];
                                          });
                                        },
                                      ),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 100,
                    // ),
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
                            List<dynamic> _listTrue = [];
                            _listTag.forEach((element) {
                              if (element['isSelected'] == true) _listTrue.add(element);
                            });
                            String data = json.encode({
                              'uuid': uuid,
                              'isDone': false,
                              'topic': _controllerTopic.text,
                              'task': _controllerTask.text,
                              'tag': _listTrue,
                            });
                            // print(data);
                            // print(Icons.home.codePoint);
                            prefs
                                .setString(
                                  uuid,
                                  data,
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
