import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackground extends StatefulWidget {

  @override
  State<BlurBackground> createState() => _BlurBackgroundState();
}

class _BlurBackgroundState extends State<BlurBackground> {

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}