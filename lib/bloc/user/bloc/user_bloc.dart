import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:hee8_lb/models/user.dart';
import 'package:hee8_lb/utils/auth/api/auth.dart';
import 'package:hee8_lb/utils/error/request_error.dart';
import 'package:hee8_lb/utils/request/api/request.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Request request;
  final Auth auth;

  UserBloc(this.request, this.auth) : super(UserInitial()) {
    on<GetUserEvent>(_getUserEvent);
    on<AuthUserEvent>(_authUserEvent);
    on<LogoutUserEvent>(_logoutUserEvent);
  }

  void _getUserEvent(GetUserEvent event, Emitter emit) async {
    emit(UserLoading());

    if (event.id == null) {
      emit(UserError("There was an error while getting your user!"));
      return;
    }

    await _getUser(emit, event.id!);
  }

  void _authUserEvent(AuthUserEvent event, Emitter emit) async {    
    emit(UserLoading());

    late String userId;

    await auth.authUser();
    var result = await auth.getUser();

    result.fold((l) { userId = l; }, (r) {
      emit(UserError(r.message));
      return;
    });

    await _getUser(emit, userId);
  }

  void _logoutUserEvent(LogoutUserEvent event, Emitter emit) async {
    emit(UserLoading());

    await auth.logoutUser();

    emit(UserLoggedOut());
  }

  _getUser(Emitter emit, String id) async {
    Either<User, RequestError> user = await request.getSingle(id);
    
    emit(
      user.fold(
        (user) => UserLoaded(user),
        (error) => UserError(error.message)
      )
    );
  }
}
