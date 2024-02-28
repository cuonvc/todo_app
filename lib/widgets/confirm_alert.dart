import 'package:flutter/material.dart';

class DeleteConfirmationDialog {
  static Future<bool?> show(BuildContext context, String title, String message) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false to indicate cancel
              },
              child: Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true to indicate continue
              },
              child: Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }
}