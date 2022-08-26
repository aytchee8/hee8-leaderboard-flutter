import 'dart:convert';

import 'package:hee8_lb/models/user.dart';
import 'package:hee8_lb/utils/constants.dart';
import 'package:hee8_lb/utils/request/api/request.dart';
import 'package:hee8_lb/utils/error/request_error.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class RequestImpl implements Request {
  String kBaseAPIUrl = kMainBaseAPIUrl;

  @override
  Future<Either<User, RequestError>> getSingle(String id) async {
    var request = await makeRequest(Uri.parse("$kBaseAPIUrl/users/$id"));

    return request.fold(
      (response) => Left(_getSingle(response)),
      (r) => Right(RequestError("There was an error while getting your user."))
    );
  }

  @override
  Future<Either<List<User>, RequestError>> getMany(int? page) async {
    var request = await makeRequest(Uri.parse("$kBaseAPIUrl/users?page=$page"));

    return request.fold(
      (response) => Left(_getMany(response)),
      (error) => Right(RequestError("There was an error while getting users!"))
    );
  }

  @override 
  Future<Either<http.Response, RequestError>> makeRequest(Uri url) async {
    try {
      var request = await http.get(url, headers: {"Access-Control-Allow-Origin": "*"});

      if (request.statusCode != 200) {
        return Right(RequestError("There was an error with your request!"));
      }

      return Left(request);
    } catch (e) {
      return Right(RequestError("There was an error with your request!"));
    }
  }

  List<User> _getMany(http.Response response) {
    List data = jsonDecode(response.body);
    List<User> users = [];
    
    for (Map<String, dynamic> item in data) {
      users.add(User.fromJson(item));
    }

    return users;
  }

  User _getSingle(http.Response response) {
    User user = User.fromJson(jsonDecode(response.body));

    return user;
  }
} 
