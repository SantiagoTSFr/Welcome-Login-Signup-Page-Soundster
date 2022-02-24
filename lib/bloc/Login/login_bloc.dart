import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth/model/User.dart';
import 'package:flutter_auth/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository _repository = new AuthRepository();
  LoginBloc(): super(Unauthenticated()) {//Aqui siempre se esta yendo por el state del super, es el tema que hay que revisar
    on<ProceedLogin>(_onProceedLogin);
    on<AppStarted>(_onAppStarted);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onProceedLogin(ProceedLogin event, Emitter<LoginState> emit){
    final loginState = this.state;
    if(loginState is Authenticated) {
      emit(mapProceedLoginToState(loginState.user));
    }
    if(loginState is Unauthenticated){
      emit(mapUnauthenticatedToState());
    }
    if(loginState is Uninitialized){
      emit(mapUninitializedToState());
    }

  }
  void _onAppStarted(AppStarted event, Emitter<LoginState> emit){

  }
  void _onLoggedOut(LoggedOut event, Emitter<LoginState> emit){

  }

  Authenticated mapProceedLoginToState(User user) {
    final String jwt = _repository.login(user);
    return Authenticated(user);
  }

  Unauthenticated mapUnauthenticatedToState() {
    return Unauthenticated();
  }

  LoginState mapUninitializedToState(){
    try {
      final isSignedIn= _repository.isSignedIn();
      if(isSignedIn) {
        final User user = _repository.getUserFromToken();
        Authenticated(user);
      } else {
        return Unauthenticated();
      }
    } catch (_) {
      return Unauthenticated();
    }

  }
}