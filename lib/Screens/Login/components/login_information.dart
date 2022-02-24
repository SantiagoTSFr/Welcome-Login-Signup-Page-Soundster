import 'package:flutter/material.dart';
import 'package:flutter_auth/bloc/Login/login_bloc.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            RoundedInputField(
              icon: Icons.person,
              hintText: "Username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              defaultValue: "Password",
              onChanged: (value) {},
            )
          ],
        );

      },
    );
  }
}

