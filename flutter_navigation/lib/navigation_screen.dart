import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(
      body: Center(child: Text('Home Screen')),
      title: 'Home',
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithDrawer(
      body: Center(child: Text('Settings Screen')),
      title: 'Settings',
    );
  }
}

class ScaffoldWithDrawer extends StatefulWidget {
  final Widget body;
  final String title;

  const ScaffoldWithDrawer({
    super.key,
    required this.body,
    this.title = 'My App',
  });

  @override
  State<ScaffoldWithDrawer> createState() => _ScaffoldWithDrawerState();
}

class BottomScreen1 extends StatelessWidget {
  const BottomScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Bottom Screen 1'));
  }
}

class BottomScreen2 extends StatelessWidget {
  const BottomScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Bottom Screen 2'));
  }
}

class _ScaffoldWithDrawerState extends State<ScaffoldWithDrawer> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    BottomScreen1(),
    BottomScreen2(),
  ];
  Widget? _body;

  @override
  void initState() {
    super.initState();
    _body = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _body = _screens[index];
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Menu")),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: _body,
    );
  }
}
