import 'package:get_it/get_it.dart';
import 'package:hee8_lb/bloc/leaderboard_bloc.dart';
import 'package:hee8_lb/utils/request/api/request.dart';
import 'package:hee8_lb/utils/request/impl/request_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LeaderboardBloc(sl()));
  sl.registerLazySingleton<Request>(() => RequestImpl());
}