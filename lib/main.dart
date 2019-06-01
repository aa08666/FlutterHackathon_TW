import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Firestore db = Firestore.instance;

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event list'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                _renderCreate(context);
              }),
        ],
      ),
      body: Center(
        child: RaisedButton(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('events').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  print("Data: ${snapshot.data.documents}");
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            document['title'],
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                      );
                    }).toList(),
                  );
              }
            },
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }

  void _renderCreate(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute()),
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final titleController = TextEditingController();
  final imageController = TextEditingController();
  final linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create event"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
                labelText: "Title",
                hintText: "Please Enter Title",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            autofocus: true,
            controller: imageController,
            decoration: InputDecoration(
                labelText: "Image URL",
                hintText: "Please Enter Image URL",
                prefixIcon: Icon(Icons.tonality)),
          ),
          TextField(
            autofocus: true,
            controller: linkController,
            decoration: InputDecoration(
                labelText: "Event Link",
                hintText: "Please Enter Event Link",
                prefixIcon: Icon(Icons.trending_up)),
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () async {
              await db.collection('events').add({
                'title': titleController.text,
                'link': linkController.text,
                'image': imageController.text,
                'date': new DateTime.now()
              });
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
