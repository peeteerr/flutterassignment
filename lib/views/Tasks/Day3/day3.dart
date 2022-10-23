import 'package:flutter/material.dart';
import 'package:it/models/task-model.dart';
import 'package:it/views/Tasks/Day3/api_controller.dart';

class Day3 extends StatefulWidget {
  const Day3({Key? key}) : super(key: key);
  static const String router = 'Day3';

  @override
  State<Day3> createState() => _Day3State();
}

class _Day3State extends State<Day3> {
  late Future<List<TaskModelDay3>> tasks;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final ApiController apiController = ApiController();
  Map<String, dynamic> editedData = {};
  @override
  void initState() {
    // TODO: implement initState
    tasks = apiController.fetchAllTasks();
    super.initState();
  }

  _editDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task Title'),
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

  _addTaskDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
            onPressed: () async {
              await _addTaskDialog();
              editedData = {'Title': _textController.text};
              final res = await apiController.addTask(editedData);
              // print(res);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<TaskModelDay3>>(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final taskItem = snapshot.data![index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.tealAccent, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID : ${taskItem.id} - ${taskItem.title}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(taskItem.createdDate),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: taskItem.isDone ? Colors.green : Colors.yellow,
                          child: Text(taskItem.isDone ? 'Is Done' : 'Is Not Done'),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await _editDialog();
                                  editedData = {'Title': _textController.text, 'ID': taskItem.id.toString(), 'IsDone': taskItem.isDone.toString()};
                                  // print(editedData);
                                  final response = await apiController.editTask(editedData);
                                  // print(response);
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                              onPressed: () async {
                                final response = await apiController.removeTask(taskItem.id);
                                // print(response);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
