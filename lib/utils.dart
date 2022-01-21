import 'package:flutter/material.dart';
import 'user.dart' as user;

DrawerHeader drawerHeader() {
  return DrawerHeader(
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
  );
}
