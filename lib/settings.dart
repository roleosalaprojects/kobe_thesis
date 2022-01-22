import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kobe_thesis/utils.dart';
import 'package:intl/intl.dart';
import 'user.dart' as user;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  DateTime selectedDate = DateTime.parse(user.birthday);

  final _name = TextEditingController(text: user.name);
  final _email = TextEditingController(text: user.email);
  final _age = TextEditingController(text: user.age);
  final _address = TextEditingController(text: user.address);
  var birthday = TextEditingController(text: user.birthday);
  String gender = (user.gender) ? "Male" : "Female";
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        birthday.text =
            DateFormat('yyyy-MM-dd').format(selectedDate).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
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
              selected: true,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.user),
                labelText: "Name",
              ),
              controller: _name,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                labelText: "Email",
              ),
              controller: _email,
            ),
            DropdownButton(
                value: gender,
                icon: const Icon(Icons.arrow_downward),
                isExpanded: true,
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    gender = newValue!;
                  });
                }),
            TextFormField(
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.birthdayCake),
                labelText: "Age",
              ),
              controller: _age,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.addressBook),
                labelText: "Address",
              ),
              keyboardType: TextInputType.multiline,
              maxLength: null,
              controller: _address,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Date of Birthdate",
              ),
              controller: birthday,
              onTap: () {
                _selectDate(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
