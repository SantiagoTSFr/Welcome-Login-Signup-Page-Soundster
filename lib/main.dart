/*import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/bloc/Login/login_bloc.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(create: ( _ ) => LoginBloc())
        ],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/home_screen/home_screen.dart';
import 'package:flutter_auth/bloc/Login/login_bloc.dart';
import 'package:flutter_auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthRepository authRepository = AuthRepository();
  runApp(BlocProvider(
    create: (context) =>
    LoginBloc(),
    child: App(null,authRepository),
  ));
}
class App extends StatelessWidget {
  final AuthRepository _authRepository;
  const App(Key key, AuthRepository authRepository)
      : _authRepository = authRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return Container(
              color: Colors.purple,
              child: Center(
                child: Text('Soundster'),
              ),
            );
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.user.username);
          }
          if (state is Unauthenticated) {
            return WelcomeScreen();
          }
          return Container();
        },
      ),
    );
  }
}
