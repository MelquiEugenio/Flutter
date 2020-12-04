import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Github Profile Search'),
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

  String _loginName = "";
  String _avatarURL = 'https://avatars3.githubusercontent.com/u/8726739?v=4';

  void getHttp() async {
    try {
      Response response = await Dio().get("http://api.github.com/users/eagle");

      setState(() {
        _avatarURL = response.data["avatar_url"].toString();
        _loginName = response.data["login"].toString();
      });

    } catch (e) {
      print(e);
      print("diggle");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 5),
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Github user name'
                  ),
                ),
            ),
            Spacer(flex: 1),
            ButtonTheme(
            minWidth: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.1,
            child:
              RaisedButton.icon(
                onPressed: getHttp,
                label: Text("SEARCH",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
               ),
                icon: Icon(
                  Icons.person_search,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.08,
                ),
                color: Colors.lightBlueAccent,
              ),
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
