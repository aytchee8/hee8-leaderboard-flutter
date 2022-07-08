import 'dart:convert';

import 'package:hee8_lb/models/user.dart';
import 'package:hee8_lb/utils/constants.dart';
import 'package:hee8_lb/utils/request/api/request.dart';

import 'package:http/http.dart' as http;

class RequestImpl extends Request {
  @override
  Future<List<User>> getMany() async {
    var request = await makeRequest(Uri.parse("$kBaseUrl/users/"));

    List<User> users = [];
    
    for (Map<String, dynamic> item in request.values) {
      users.add(User.fromJson(item));
    }

    return users;
  }

  @override
  Future<User> getSingle(String id) async {
    var request = await makeRequest(Uri.parse("$kBaseUrl/users/$id"));
    User user = User.fromJson(request);

    return user;
  }

  @override 
  Future<Map<String, dynamic>> makeRequest(Uri url) async {
    var request = await http.get(url);
    return jsonDecode(request.body);
  }
} 