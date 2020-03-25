import 'dart:convert';

import 'package:flutter_app/Consts/link_api.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:http/http.dart' as http;

class HttpService {
  var url = '${linkApi}todos/';

  getAllTasks({String endpoint}) async {
    var getResponse = await http.get('$url$endpoint');
    if (getResponse.statusCode == 200) {
      return _parseTasks(getResponse.bodyBytes);
    } else {
      print(getResponse.statusCode);
      throw Exception("Erro no GET ALL: ${getResponse.statusCode}");
    }
  }

  getSingleTask(int id) async {
    var getResponse = await http.get('$url$id');
    if (getResponse.statusCode == 200) {
      return json.decode(utf8.decode(getResponse.bodyBytes));
    } else {
      print("GET SINGLE TASK STATUS: ${getResponse.statusCode}");
      throw new Exception("Erro no GET single: ${getResponse.statusCode}");
    }
  }

  List<Task> _parseTasks(responseBody) {
    final parsed =
        json.decode(utf8.decode(responseBody)).cast<Map<String, dynamic>>();
    return parsed.map<Task>((json) => Task.fromJson(json)).toList();
  }

  postTask({Map<String, dynamic> map}) async {
    var postResponse = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(map));

    if (postResponse.statusCode < 200 || postResponse.statusCode > 400) {
      throw new Exception("Erro no POST:  ${postResponse.statusCode}");
    }

    print(postResponse.body.toString());

    return Task.fromJson(jsonDecode(postResponse.body));
  }

  putTask(int id, {Map<String, dynamic> map}) async {
    var putResponse = await http.put('$url$id',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(map));

    if (putResponse.statusCode < 200 || putResponse.statusCode > 400) {
      throw new Exception("Erro no PUT: ${putResponse.statusCode}");
    }
  }

  patchTask(int id, {Map<String, dynamic> map}) async {
    var patchResponse = await http.patch('$url$id',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(map));

    if (patchResponse.statusCode < 200 || patchResponse.statusCode > 400) {
      throw new Exception("Erro no PATCH:  ${patchResponse.statusCode}");
    }
  }

  deleteTask(int id) async {
    var response = await http.delete(
      '$url$id',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );

    print("DELETE REQUEST: " + response.statusCode.toString());
  }
}
