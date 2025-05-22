// Define your BLoC
import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  // Implement your event handlers
  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: event.email,
        password: event.password,
      );
      if (response.session != null) {
        emit(AuthSuccess(response.session));
      } else {
        emit(AuthFailure("Registration failed. Please try again."));
      }
    } catch (e) {
      emit(AuthFailure("Registration failed: $e"));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: event.email,
        password: event.password,
      );
      if (response.session != null) {
        emit(AuthSuccess(response.session));
      } else {
        emit(AuthFailure("Login failed. Please check your credentials."));
      }
    } catch (e) {
      emit(AuthFailure("Login failed: $e"));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Supabase.instance.client.auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure("Logout failed: $e"));
    }
  }
}
