part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
}

class UserLoggedOut extends UserState {}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
