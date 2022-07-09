part of 'leaderboard_bloc.dart';

@immutable
abstract class LeaderboardEvent {}

class GetLeaderboardUsers extends LeaderboardEvent {}

class GetMoreLeaderboardUsers extends LeaderboardEvent {
  final int page;

  GetMoreLeaderboardUsers(this.page);
}