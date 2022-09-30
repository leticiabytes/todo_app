import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            print('clicked todo item');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          tileColor: Colors.white,
          leading: Icon(Icons.check_box, color: tdBlue),
          title: Text(
            'Check Mail',
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: TextDecoration.lineThrough),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              // color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: tdRed,
              iconSize: 24,
              icon: Icon(Icons.delete),
              onPressed: () {
                print('clicked delete icon todoitem');
              },
            ),
          ),
        ));
  }
}
