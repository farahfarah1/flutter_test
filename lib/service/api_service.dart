import 'dart:convert';

import 'package:flutter_test_1/model/user.dart';
import 'package:http/http.dart' as http;

class FetchUser {
  var data = [];
  List<User> results = [];
  String urlList = 'https://jsonplaceholder.typicode.com/users/';

  Future<List<User>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);

        results = data.map((e) => User.fromJson(e)).toList();

        if (query != null) {
          results = results.where((element) {
            if (element.name!.toLowerCase().contains(query.toLowerCase()) ||
                element.id.toString() == query) {
              return true;
            } else {
              return false;
            }
          }).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
