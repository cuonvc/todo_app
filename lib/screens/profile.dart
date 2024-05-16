import 'package:flutter/material.dart';
import 'package:todo_app/widgets/app_bar.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar()),

      body: Text("The Profile screen"),
    );
  }
}