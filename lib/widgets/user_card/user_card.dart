import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hee8_lb/bloc/user/bloc/user_bloc.dart';
import 'package:hee8_lb/injection_container.dart';
import 'package:hee8_lb/widgets/user_card/user_rank_card.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key}) : super(key: key);

  final SharedPreferences prefs = sl<SharedPreferences>();
  final userBloc = sl<UserBloc>();

  @override
  Widget build(BuildContext context) {
    if (prefs.getString("userId") != null) {
      userBloc.add(GetUserEvent(prefs.getString("userId")));
    }

    return BlocProvider(
      create: (_) => userBloc,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is UserLoaded) {
            return UserRankCard(state.user, userBloc);
          } else if (state is UserError || state is UserLoggedOut) {
            return _loginButton();
          } else {
            return _loginButton();
          }
        },
      )
    );
  }

  Widget _loginButton() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 49, 54, 61)),
        foregroundColor: MaterialStateProperty.all(Colors.white)
      ),
      child: const Text("Log in with Discord"),
      onPressed: () async {
        userBloc.add(AuthUserEvent());
      },
    );
  }
}