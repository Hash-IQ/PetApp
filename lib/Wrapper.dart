import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'features/Home/Screens/Home/Home.dart';
import 'features/Widget/Screens/SelectLocation.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/auth_screen.dart';

class Wrapper extends StatelessWidget {
  final Logger _log = Logger();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>( 
      builder: (context, state) {
        _log.i(state);
        if (state is LoggedIn) {
          _log.i("Loggin in as ${state.user.displayName}");
          return   Hive.box("location").get("locationName") == null
              ? SelectLocation()
              : Home();
        } else if (state is LoggedOut) {
          _log.i("Signed Out");
          return AuthScreen();
        }
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
