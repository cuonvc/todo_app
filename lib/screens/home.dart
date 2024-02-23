import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/blur_background.dart';
import 'package:todo_app/widgets/drawer.dart';
import 'package:todo_app/widgets/search_box.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../widgets/app_bar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Todo.todoList();

  bool clickedAddItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: BaseAppBar(appBar: AppBar()),
        drawer: BaseDrawer(),

        body: GestureDetector(
          onTap: () {
            setState(() {
              clickedAddItem = false;
            });
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    SearchBox(),
                    Expanded(
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50, bottom: 20),
                              child: Text(
                                "All Todos",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),

                            for(Todo todo in todoList)
                              TodoItem(todo: todo)
                          ],
                        )
                    )
                  ],
                ),
              ),

              //blur background
              Visibility(
                visible: clickedAddItem ? true : false,
                child: BlurBackground()
              ),

              //add todo item
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20, bottom: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: clickedAddItem ? true : false,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 0
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Add a new item",
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton(
                              icon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: clickedAddItem == true ? Icon(Icons.send) : Icon(Icons.add),
                              ),
                              color: tdBlue,
                              iconSize: 30,
                              onPressed: () {
                                setState(() {
                                  clickedAddItem = true;
                                });
                              },
                            )
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}