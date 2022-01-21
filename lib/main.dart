import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kobe_thesis/routes.dart';
import 'package:kobe_thesis/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kobe",
      initialRoute: "/",
      routes: routes(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: Drawer(
        child: ListView(
          children: [
            drawerHeader(),
            ListTile(
              title: const Text('Home'),
              leading: const FaIcon(FontAwesomeIcons.home),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
              selected: true,
            ),
            ListTile(
              title: const Text('Violators Information'),
              leading: const FaIcon(FontAwesomeIcons.users),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const FaIcon(FontAwesomeIcons.cog),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
          ],
        ),
      ),
    );
  }
}
