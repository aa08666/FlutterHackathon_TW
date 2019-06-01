import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.class_),
            onPressed: () {
              // Navigator.of(context).push(route)
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).push(route)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            new Card(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 400,
                    height: 200,
                    child: new Column(
                      children: <Widget>[
                        new Text("data",
                          style: new TextStyle(
                          ),
                        ),
                        new Expanded(
                          child: new Divider(),
                        ),
                        new Text("123",
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                            
                          ),
                        ),
                      ],
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: new Border.all(width: 0.3, color: Colors.red),
                      image: new DecorationImage(
                        image: ExactAssetImage('images/123.jpg'),
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
