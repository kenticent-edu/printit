import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_mapEmailChangedToState);
    on<PasswordChanged>(_mapPasswordChangedToState);
    on<LoginButtonPressed>(_mapLoginButtonPressedToState);
  }

  Future<void> _mapEmailChangedToState(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _mapPasswordChangedToState(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _mapLoginButtonPressedToState(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    // User authentication mock
    await Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(status: Status.success));
    });
  }
}
