import 'package:flutter/material.dart';
import 'package:todonote/add.dart';
import 'package:todonote/widgets/list_todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddTodo(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String date = DateTime.now().day.toString() + ' / ' + DateTime.now().month.toString() + ' / ' + (DateTime.now().year + 543).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.065),
                  child: Text(
                    'Todo-Note',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ListTodo(
                        isDone: false,
                        toppic: 'GGG',
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.06,
              top: MediaQuery.of(context).size.height * 0.1,
              child: Card(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(date),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.of(context).pushNamed('/add'),
      ),
    );
  }
}
