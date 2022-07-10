import 'package:dartz/dartz.dart';
import 'package:hee8_lb/utils/error/request_error.dart';

abstract class Auth {
  Future<Either<String, RequestError>> authUser();
  Future<Either<String, RequestError>> getAccessToken(String code);

  /// Get logged in users ID.
  Future<Either<String, RequestError>> getUser();
}