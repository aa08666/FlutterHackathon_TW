import 'package:flutter/material.dart';

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
        title: Text('First Route'),
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
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
              ],
            ),
        )
      ),
    );
  }
}
