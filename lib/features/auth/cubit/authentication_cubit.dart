import 'package:bloc/bloc.dart';
import 'package:catan_gui_flutter/models/user.dart';
import 'package:catan_gui_flutter/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final IUserRepository _userRepository;
  AuthenticationCubit()
      : _userRepository = GetIt.I.get<IUserRepository>(),
        super(NotLoggedIn());

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(WaitLoggingIn());

      final user =
          await _userRepository.login(email: email, password: password);

      emit(LoginError());

      emit(LoggedIn(user: user));
    } catch (e) {
      emit(LoginError());
    }
  }

  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      emit(WaitRegistering());

      final user = await _userRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      emit(LoggedIn(user: user));
    } catch (e) {
      emit(RegisterError());
    }
  }

  void logout() async {
    emit(NotLoggedIn());
  }
}
