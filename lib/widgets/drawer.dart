import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class BaseDrawer extends StatelessWidget {

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      backgroundColor: tdBGColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 90,
            child: DrawerHeader(
              child: Text(
                "T O D O   A P P",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, "/settings");
            },
          ),
        ],
      ),
    );
  }
}