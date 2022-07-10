import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:hee8_lb/models/user.dart';
import 'package:hee8_lb/utils/request/api/request.dart';
import 'package:hee8_lb/utils/error/request_error.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  final Request request;

  LeaderboardBloc(this.request) : super(LeaderboardInitial()) {
    on<GetLeaderboardUsers>(_getLeaderboardUsers);
    on<GetMoreLeaderboardUsers>(_getMoreLeaderboardUsers);
  }

  void _getLeaderboardUsers(LeaderboardEvent event, Emitter emit) async {
    emit(LeaderboardLoading());

    Either<List<User>, RequestError> users = await request.getMany(0);

    emit(
      users.fold(
        (users) => LeaderboardLoaded(users), 
        (error) => LeaderboardError(error.message)
      )
    );
  }

  void _getMoreLeaderboardUsers(GetMoreLeaderboardUsers event, Emitter emit) async {
    Either<List<User>, RequestError> users = await request.getMany(event.page);

    emit(
      users.fold(
        (users) => LeaderboardMoreLoaded(users), 
        (error) => LeaderboardError(error.message)
      )
    );
  }
}
