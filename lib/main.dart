import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: RandomWords(),
      initialRoute: '/',
      routes: {
        Home.routeName: (context) => Home(),
        AddScreen.routeName: (context) => AddScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('photo diary'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: RandomWords(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }
}


class RandomWordsState extends State<RandomWords> {
  final _suggestions = <Map>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }


  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll([{'text': 'hello', 'map': { 'text': 'text' }}]); /*4*/
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(Map event) {
    return ListTile(
      title: Text(
        event['map']['text'],
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class AddScreen extends StatelessWidget {
  static const routeName = '/add';
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
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
