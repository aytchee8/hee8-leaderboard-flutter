import 'package:dartz/dartz.dart';
import 'package:hee8_lb/utils/error/request_error.dart';

import '../../../models/user.dart';

import 'package:http/http.dart' as http;

abstract class Request {
  /// Gets single user by ID.
  Future<Either<User, RequestError>> getSingle(String id);

  /// Gets multiple users. (100)
  Future<Either<List<User>, RequestError>> getMany();

  /// Makes request to the desired URL.
  Future<http.Response> makeRequest(Uri url);
}