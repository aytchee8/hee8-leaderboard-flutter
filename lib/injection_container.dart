import 'package:get_it/get_it.dart';
import 'package:hee8_lb/bloc/leaderboard/leaderboard_bloc.dart';
import 'package:hee8_lb/bloc/user/bloc/user_bloc.dart';
import 'package:hee8_lb/utils/auth/api/auth.dart';
import 'package:hee8_lb/utils/auth/impl/auth_impl.dart';
import 'package:hee8_lb/utils/request/api/request.dart';
import 'package:hee8_lb/utils/request/impl/request_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LeaderboardBloc(sl()));
  sl.registerFactory(() => UserBloc(sl(), sl()));

  sl.registerLazySingleton<Request>(() => RequestImpl());
  sl.registerLazySingleton<Auth>(() => AuthImpl());

  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}