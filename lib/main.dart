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
          child: Text('Open route'),
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

class SecondRoute extends StatelessWidget {
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
            decoration: InputDecoration(
                labelText: "Title",
                hintText: "Please Enter Title",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "Image URL",
                hintText: "Please Enter Image URL",
                prefixIcon: Icon(Icons.tonality)),
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "Event Link",
                hintText: "Please Enter Event Link",
                prefixIcon: Icon(Icons.trending_up)),
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () async {
              await db.collection('events').add({
                'title': 'Hi Flutter Hackthon',
                'link': 'http://google.com',
                'image': 'here is image',
                'date': new DateTime.now()
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstRoute()),
              );
            },
          ),
        ],
      )),
    );
  }
}
