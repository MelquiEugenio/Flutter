import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'counter.dart';

final counter = Counter();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with MobX',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter counter app with MobX')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            Text(
              'Counter value:',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            Observer(
              builder: (_) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Spacer(flex: 4),
          ]
        )
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80.0,
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter.decrement,
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: counter.increment,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}