import 'package:dartz/dartz.dart';
import 'package:hee8_lb/utils/error/request_error.dart';

abstract class Auth {
  /// Authorizes user.
  Future<Either<String, RequestError>> authUser();

  /// Gets access token of the current user
  Future<Either<String, RequestError>> getAccessToken(String code);

  /// Get logged in users ID.
  Future<Either<String, RequestError>> getUser();

  /// Logs out current user.
  Future<void> logoutUser();
}