import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {

  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  final onTriggerToUpdate;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.onTriggerToUpdate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
        child: Slidable(
          endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    onTriggerToUpdate(todo);
                  },
                  icon: Icons.edit,
                  foregroundColor: tdBlue,
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {
                    onDeleteItem(todo.id);
                  },
                  icon: Icons.delete,
                  foregroundColor: tdRed,
                ),
              ]
          ),
          child: itemBuilder(context),
        ),
    );
  }

  ListTile itemBuilder(BuildContext context) {
    return ListTile(
      onTap: () {
        print("Clicked on Todo Item.");
      },
      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      tileColor: Colors.white,
      leading: IconButton(
        icon: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank), //flexible
        color: tdBlue,
        onPressed: () {
          onToDoChanged(todo);
        },
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
    );
  }
}