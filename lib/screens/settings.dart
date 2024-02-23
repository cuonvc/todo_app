import 'package:flutter/material.dart';
import 'package:todo_app/widgets/app_bar.dart';
import 'package:todo_app/widgets/drawer.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar()),

      body: Text("The Setting page"),
    );
  }
}