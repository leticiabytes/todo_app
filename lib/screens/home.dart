import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../models/todo.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _searchToDo = [];

  @override
  void initState() {
    _searchToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      'All ToDos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (ToDo todo in _searchToDo)
                    TodoItem(
                      todo: todo,
                      onToDoChanged: _handleChangeToDo,
                      onDeleteItem: _handleDeleteitem,
                    ),
                ],
              ))
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                      hintText: 'Add item', border: InputBorder.none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  _handleAddItem(_todoController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    minimumSize: const Size(60, 60),
                    elevation: 10),
                child: const Text('+', style: TextStyle(fontSize: 40)),
              ),
            )
          ]),
        )
      ]),
    );
  }

  void _handleChangeToDo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteitem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _handleAddItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          description: toDo));
    });
    _todoController.clear();
  }

  void _handleSearchItem(String enterdKeyword) {
    List<ToDo> results = [];

    if (enterdKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.description!
              .toLowerCase()
              .contains(enterdKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _handleSearchItem(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 26,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      leadingWidth: 80,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpeg'),
          ),
        ),
      ]),
    );
  }
}
