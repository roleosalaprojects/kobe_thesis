import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kobe_thesis/utils.dart';
import 'package:kobe_thesis/violators.dart';

class ViolationPage extends StatefulWidget {
  const ViolationPage({Key? key}) : super(key: key);

  @override
  _ViolationPageState createState() => _ViolationPageState();
}

class _ViolationPageState extends State<ViolationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Violators")),
      drawer: Drawer(
        child: ListView(
          children: drawerItems(context),
        ),
      ),
      body: Container(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: violators.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(violators[index]["image"]),
                ),
                title: Text(violators[index]["name"]),
                subtitle: Text("${violators[index]["age"]} years old"),
                trailing: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    foregroundColor: MaterialStateProperty.all(Colors.blue),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const FaIcon(FontAwesomeIcons.addressBook),
                  onPressed: () {},
                ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
