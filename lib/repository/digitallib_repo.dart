import 'dart:convert';
import 'dart:core';

import '../model/tesla_model.dart';
import 'package:http/http.dart' as http;

class DigitalLibRepository {
  Future<DigitalLibModel> data() async {
    final response = await http.post(
        Uri.parse("http://15.206.132.105/ulektzConnectNew/campusAPI/api.php"),
        body: json.encode({
          "functionName": "elibraryBookStore",
          "page": "1",
          "size": "",
          "instId": "132",
          "userId": "192277",
          "searchTxt": ""
        }));

    return DigitalLibModel.fromJson(json.decode(response.body));
  }
}
