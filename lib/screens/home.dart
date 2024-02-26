import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  final _textFieldController = TextEditingController();

  List<Todo> foundTodo = [];
  bool typeTextField = false;


  @override
  void initState() {
    foundTodo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: BaseAppBar(appBar: AppBar()),
        drawer: BaseDrawer(),

        body: Container(
          // onTap: () {
          //   setState(() {
          //     typeTextField = false;
          //     _textFieldController.text = "";
          //     Slidable.of(context)?.close();
          //   });
          // },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    SearchBox(searchByKeyword: _searchByKeyword),
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

                            for(Todo todo in foundTodo.reversed)
                              TodoItem(
                                todo: todo,
                                onToDoChanged: _handleTodoChange,
                                onDeleteItem: _handleTodoDelete,
                                onTriggerToUpdate: _triggerTodoUpdate,
                              )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //blur background
              Visibility(
                visible: typeTextField ? true : false,
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
                            visible: typeTextField ? true : false,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              margin: const EdgeInsets.only(right: 20),
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
                                controller: _textFieldController,
                                // autofocus: true,
                                decoration: InputDecoration(
                                  hintText: "Thêm một ghi chú mới...",
                                  border: InputBorder.none,
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
                            child: Row(
                              children: [
                                Visibility(
                                  visible: typeTextField ? true : false,
                                    child: IconButton(
                                      icon: Padding(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Icon(Icons.keyboard_arrow_down_outlined),
                                      ),
                                      color: tdRed,
                                      iconSize: 30,
                                      onPressed: () {
                                        setState(() {
                                          typeTextField = false;
                                          _textFieldController.text = "";
                                        });
                                      },
                                    )
                                ),

                                IconButton(
                                  icon: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: typeTextField == true ? Icon(Icons.send) : Icon(Icons.add),
                                  ),
                                  color: tdBlue,
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      typeTextField = true;
                                    });
                                    if (_textFieldController.text.isNotEmpty) {
                                      _handleTodoAdd(_textFieldController.text);
                                      typeTextField = false;  //dismiss blur layer
                                    }
                                  },
                                )
                              ],

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

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _triggerTodoUpdate(Todo todo) {
    setState(() {
      typeTextField = true;
      _textFieldController.text = todo.description.toString();
    });
  }

  void _handleTodoDelete(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void _handleTodoAdd(String description) {
    setState(() {
      todoList.add(
          Todo(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              description: description
          )
      );
    });
    _textFieldController.clear();
  }

  void _searchByKeyword(String keyword) {
    List<Todo> resultList = [];
    if (keyword.isEmpty) {
      resultList = todoList;
    } else {
      resultList = todoList
          .where((element) => element.description!.toLowerCase()
          .contains(keyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundTodo = resultList;
    });
  }
}