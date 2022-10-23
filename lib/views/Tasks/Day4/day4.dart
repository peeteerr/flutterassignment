import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:it/views/Tasks/Day4/task-container.dart';
import 'package:it/views/Tasks/Day4/tasks-provider.dart';
import 'package:provider/provider.dart';

class Day4 extends StatefulWidget {
  const Day4({Key? key}) : super(key: key);
  static const String router = 'Day4';

  @override
  State<Day4> createState() => _Day4State();
}

class _Day4State extends State<Day4> {
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // setData(var data, BuildContext context) {
  //   for (var element in data) {
  //     Provider.of<TaskProviderList>(context, listen: false).add(
  //       TaskModelDay3(
  //         id: element['id'],
  //         title: element['title'],
  //         isDone: element['isDone'],
  //         createdDate: element['createdDate'],
  //       ),
  //     );
  //   }
  // }

  setDataOnce(var data, BuildContext context) {
    Provider.of<TaskProviderList>(context).setItems(data, context);
  }

  Future<void> _addTaskDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _textController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProviderList(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          actions: [
            IconButton(
              onPressed: () async {
                await _addTaskDialog();
                FirebaseFirestore.instance
                    .collection('tasks')
                    .add({'id': Random().nextInt(100), 'title': _textController.text, 'isDone': true, 'createdDate': '10/2'});
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
              final items = snapshot.data!.docs;
              // setData(items, context);
              setDataOnce(items, context);
              return Consumer<TaskProviderList>(
                builder: (context, items, child) {
                  return ListView.builder(
                    itemCount: items.items.length,
                    itemBuilder: (context, index) {
                      return TaskShapeDay4(model: items.items[index]);
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
