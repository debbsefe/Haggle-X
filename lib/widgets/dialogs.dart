import 'package:flutter/material.dart';

dialogBox(String content, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Message"),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('OK', style: TextStyle(color: Colors.red)),
              onPressed: () {
                int count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              },
            ),
          ],
        );
      });
}

showLoader(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );
}
