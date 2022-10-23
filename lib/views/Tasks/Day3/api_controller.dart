import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:it/models/task-model.dart';

class ApiController {
  final String getUrl = 'https://api.mohamed-sadek.com/Task/Get';

  Future<List<TaskModelDay3>> fetchAllTasks() async {
    List<TaskModelDay3> tasks = [];
    final response = await http.get(Uri.parse(getUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      for (var i = 0; i < body['Data'].length; i++) {
        tasks.add(TaskModelDay3.fromJson(body['Data'][i]));
      }
    }
    return tasks;
  }

  removeTask(int taskId) async {
    // final response = await http.delete(Uri.parse('https://api.mohamed-sadek.com/Task/Delete/$taskId'));
    // return response.body;

    var url = Uri.https("api.mohamed-sadek.com", "/Task/Delete", {'id': taskId.toString()});
    var res = await delete(url);
    return jsonDecode(res.body);
  }

// THIS ERROR IS FACING ME IN EDIT AND ADD TASK
  //{"type":"https://tools.ietf.org/html/rfc7231#section-6.5.13","title":"Unsupported Media Type",
  // "status":415,"traceId":"00-f5770e7ed2fc3b45ac2143c531960fc5-edf3035496862f4f-00"}
  editTask(Map<String, dynamic> taskData) async {
    var url = Uri.https("api.mohamed-sadek.com", "/Task/PUT", taskData);
    var res = await put(url);
    // final response = await http.put(Uri.parse('https://api.mohamed-sadek.com/Task/PUT'), body: taskData);
    return res.body;
  }

  addTask(Map<String, dynamic> data) async {
    var url = Uri.https("api.mohamed-sadek.com", "/Task/POST", data);
    var res = await post(url);
    return res.body;
  }
}
