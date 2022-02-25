part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class ProceedLogin extends LoginEvent{
  final User user;

  ProceedLogin(this.user);
  List<Object> get props => [user];
}

class AppStarted extends LoginEvent{
  List<Object> get props => [];
}

class LoggedOut extends LoginEvent{
  List<Object> get props => [];
}

