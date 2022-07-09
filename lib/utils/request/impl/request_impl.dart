import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hee8_lb/models/user.dart';
import 'package:hee8_lb/utils/constants.dart';
import 'package:hee8_lb/utils/request/api/request.dart';

import 'package:http/http.dart' as http;

import '../../error/request_error.dart';

class RequestImpl implements Request {
  @override
  Future<Either<User, RequestError>> getSingle(String id) async {
    var request = await makeRequest(Uri.parse("$kBaseUrl/users/$id"));

    if (request.statusCode != 200) {
      return Right(RequestError("There was an error while getting the user!"));
    }

    User user = User.fromJson(jsonDecode(request.body));

    return Left(user);
  }

  @override
  Future<Either<List<User>, RequestError>> getMany(int? page) async {
    var request = await makeRequest(Uri.parse("$kBaseUrl/users?page=$page"));
    
    if (request.statusCode != 200) {
      return Right(RequestError("There was an error while getting users!"));
    }

    List data = jsonDecode(request.body);
    List<User> users = [];
    
    for (Map<String, dynamic> item in data) {
      users.add(User.fromJson(item));
    }

    return Left(users);
  }

  @override 
  Future<http.Response> makeRequest(Uri url) async {
    var request = await http.get(url, headers: {"Access-Control-Allow-Origin": "*"});
    return request;
  }
} 