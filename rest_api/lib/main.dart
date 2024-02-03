import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  MyHomePage({required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
                controller: myController,
                decoration: InputDecoration(hintText: 'Github user name'),
              ),
            ),
            Spacer(flex: 1),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.1,
              child: ElevatedButton.icon(
                onPressed: getUser,
                label: Text(
                  "SEARCH",
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
              ),
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  void getUser() async {
    try {
      Response response =
      await Dio().get("http://api.github.com/users/${myController.text}");

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Github User Profile'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 1),
                    Image.network(
                      response.data["avatar_url"],
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : LinearProgressIndicator();
                      },
                    ),
                    Spacer(flex: 2),
                    Text(
                      response.data['name'],
                    ),
                    Spacer(flex: 2),
                    Text(
                      response.data['bio'].toString(),
                    ),
                    Spacer(flex: 2),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: ElevatedButton.icon(
                        onPressed: getRepos,
                        label: Text(
                          "SEE REPOSITORIES",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } catch (e) {
      print(e);
      print("diggle");
    }
  }

  void getRepos() async {
    try {
      Response repos = await Dio()
          .get("http://api.github.com/users/${myController.text}/repos");

      List<Widget> list = [];

      for (var repo in repos.data) {
        list.add(
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Text(repo['language'].toString()),
                  title: Text(repo['name'].toString()),
                  subtitle: Text(repo['description'].toString()),
                ),
              ],
            ),
          ),
        );
      }

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Repositories'),
              ),
              body: ListView(
                children: list,
              ),
            );
          },
        ),
      );
    } catch (e) {
      print(e);
      print("weeggle");
    }
  }
}
