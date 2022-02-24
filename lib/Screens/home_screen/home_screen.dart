import 'package:flutter/material.dart';
import 'package:flutter_auth/bloc/Login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                //BlocProvider.of<LoginBloc>(context).add(LoggedOut());
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text('Bienvenido $name!'),
          )
        ],
      ),
    );
  }
}