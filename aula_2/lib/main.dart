import 'package:aula_2/add_page.dart';
import 'package:aula_2/taskrow.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'TODO List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    loadlist();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, position) {
          return TaskRow(
              callback: (){
                loadlist();
              },
              text: todoList[position]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await Navigator.push(
                context,
                MaterialPageRoute(
                    settings: RouteSettings(name: 'AddPage'),
                    builder: (context) => AddPage()),
              ) ??
              false;

          print(res);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void loadlist() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      todoList = prefs.getStringList('tasks') ?? [];
    });
  }
}
