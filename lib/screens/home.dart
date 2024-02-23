import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/blur_background.dart';
import 'package:todo_app/widgets/todo_item.dart';

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
      appBar: _buildAppBar(),
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
                  searchBox(),
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

            //blur
            Visibility(
              visible: clickedAddItem ? true : false,
              child: BlurBackground()
            ),

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

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: tdBlack, size: 20,),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 25
            ),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
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