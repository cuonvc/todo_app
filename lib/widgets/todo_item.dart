import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {

  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          print("Clicked on Todo Item");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank, //flexible
          color: tdBlue,
        ),
        title: Text(
          todo.description!, //flexible
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              fontWeight: FontWeight.w400,
              decoration: todo.isDone? TextDecoration.lineThrough : null  //flexible
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
            onPressed: () {
              print("Clicked on Delete icon");
            },
          ),
        ),
      ),
    );
  }
}