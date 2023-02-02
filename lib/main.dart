import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.blue.shade400,
        scaffoldBackgroundColor: Colors.blue.shade400,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List note = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 5.0,
        centerTitle: true,
        title: Text(
          'NOTE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue.shade700,
          size: 35,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Note'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Notes'),
                  onChanged: (String value) {
                    input = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        note.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: note.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(note[index]),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      note[index],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          note.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
