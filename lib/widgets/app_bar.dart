import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {

  const BaseAppBar({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: tdBGColor,
      leading: Icon(Icons.menu, color: tdBlack, size: 30,),
      actions: [
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avt.jpeg'),
          ),
        )
      ],
    );
  }
}