import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart' as user;

List<Widget> drawerItems(BuildContext context) {
  return [
    DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.image),
            radius: 30.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            user.email,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
    ListTile(
      title: const Text('Home'),
      leading: const FaIcon(FontAwesomeIcons.home),
      onTap: () {
        Navigator.pushNamed(context, "/");
      },
      selected: true,
    ),
    ListTile(
      title: const Text('Violators'),
      leading: const FaIcon(FontAwesomeIcons.users),
      onTap: () {
        Navigator.pushNamed(context, '/violators');
      },
    ),
    ListTile(
      title: const Text('Settings'),
      leading: const FaIcon(FontAwesomeIcons.cog),
      onTap: () {
        Navigator.pushNamed(context, "/settings");
      },
    ),
  ];
}
