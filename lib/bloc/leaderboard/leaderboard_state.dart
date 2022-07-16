part of 'leaderboard_bloc.dart';

@immutable
abstract class LeaderboardState {}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoading extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  final List<User> users;

  LeaderboardLoaded(this.users);
}

class LeaderboardMoreLoaded extends LeaderboardState {
  final List<User> users;

  LeaderboardMoreLoaded(this.users);
}

class LeaderboardError extends LeaderboardState {
  final String message;

  LeaderboardError(this.message);
}
