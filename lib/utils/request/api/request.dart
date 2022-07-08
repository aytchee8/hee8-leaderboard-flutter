import '../../../models/user.dart';

abstract class Request {
  /// Gets single user by ID.
  Future<User> getSingle(String id);

  /// Gets multiple users. (100)
  Future<List<User>> getMany();

  /// Makes request to the desired URL.
  Future<Map<String, dynamic>> makeRequest(Uri url);
}