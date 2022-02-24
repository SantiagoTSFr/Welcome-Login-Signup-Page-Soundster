part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class ProceedLogin extends LoginEvent{
  final User user;

  ProceedLogin(this.user);
}

class AppStarted extends LoginEvent{

}

class LoggedOut extends LoginEvent{

}

