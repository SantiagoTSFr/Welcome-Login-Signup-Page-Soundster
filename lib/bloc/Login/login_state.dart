part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class Authenticated extends LoginState {
  final User user;
  Authenticated(this.user);
  @override
  String toString() => 'autenticado - ' + user.username;
}

class Unauthenticated extends LoginState {
  @override
  String toString() => 'Sin autenticar';

}

class Uninitialized extends LoginState {
  @override
  String toString() => 'Sin inicializar';

}


