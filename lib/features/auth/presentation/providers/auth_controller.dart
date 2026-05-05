import 'dart:developer' as developer;

import 'package:flutter_app/features/auth/data/models/responses/user_response.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_app/features/auth/data/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUserProvider = AsyncNotifierProvider<AuthNotifier, UserResponse?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<UserResponse?> {
  @override
  Future<UserResponse?> build() async => null;

  // Authentication with credentials
  Future<UserResponse?> signUpWithCredentials(
    String email,
    String password,
  ) async {
    return _runAuthAndSync(
      startMessage: 'Iniciando registro con correo y contraseña...',
      successMessage: 'Registro exitoso',
      errorMessage: 'ERROR en el flujo de registro',
      authAction: (repo) => repo.signUpWithCredentials(email, password),
    );
  }

  Future<UserResponse?> signInWithCredentials(
    String email,
    String password,
  ) async {
    return _runAuthAndSync(
      startMessage: 'Iniciando inicio de sesión con correo y contraseña...',
      successMessage: 'Login exitoso',
      errorMessage: 'ERROR en el flujo de inicio de sesión',
      authAction: (repo) => repo.signInWithCredentials(email, password),
    );
  }

  Future<void> signOut() async {
    return _runSignOut(
      startMessage: 'Cerrando sesión...',
      successMessage: 'Sesión cerrada correctamente',
      errorMessage: 'Error al cerrar sesión',
      signOutAction: (repo) => repo.signOut(),
    );
  }

  // Authentication with google
  Future<UserResponse?> signInWithGoogle() async {
    return _runAuthAndSync(
      startMessage: 'Iniciando sesión social con google...',
      successMessage: 'Login exitoso',
      errorMessage: 'ERROR en el flujo de inicio de sesión',
      authAction: (repo) => repo.signInWithGoogle(),
    );
  }

  Future<void> signOutGoogle() async {
    return _runSignOut(
      startMessage: 'Cerrando sesión...',
      successMessage: 'Sesión cerrada correctamente',
      errorMessage: 'Error al cerrar sesión',
      signOutAction: (repo) => repo.signOutGoogle(),
    );
  }

  // User data management
  Future<UserResponse> syncUser() async {
    return _runUserRead(
      successMessage: 'Usuario sincronizado correctamente',
      errorMessage: 'Error sincronizando usuario con backend',
      action: (repo) => repo.syncUser(),
    );
  }

  Future<UserResponse> loadMe() async {
    return _runUserRead(
      successMessage: 'Datos del usuario cargados correctamente',
      errorMessage: 'Error cargando datos del usuario',
      action: (repo) => repo.getMe(),
    );
  }

  // Helper methods for auth flows
  Future<UserResponse?> _runAuthAndSync({
    required String startMessage,
    required String successMessage,
    required String errorMessage,
    required Future<void> Function(AuthRepository repo) authAction,
  }) async {
    final repo = ref.read(authRepositoryProvider);
    state = const AsyncLoading<UserResponse?>();

    developer.log(startMessage, name: 'AuthFlow', level: 800);

    final result = await AsyncValue.guard<UserResponse?>(() async {
      await authAction(repo);
      return await repo.syncUser();
    });

    if (result.hasError) {
      developer.log(
        errorMessage,
        name: 'AuthFlow',
        error: result.error,
        stackTrace: result.stackTrace,
        level: 1000,
      );
    } else {
      developer.log(successMessage, name: 'AuthFlow', level: 800);
    }

    state = result;
    return result.valueOrNull;
  }

  Future<UserResponse> _runUserRead({
    required String successMessage,
    required String errorMessage,
    required Future<UserResponse> Function(AuthRepository repo) action,
  }) async {
    final repo = ref.read(authRepositoryProvider);
    state = const AsyncLoading<UserResponse?>();
    final result = await AsyncValue.guard<UserResponse>(() => action(repo));

    if (result.hasError) {
      developer.log(
        errorMessage,
        name: 'AuthSync',
        error: result.error,
        stackTrace: result.stackTrace,
        level: 1000,
      );
    } else {
      developer.log(successMessage, name: 'AuthSync', level: 800);
    }

    state = result;
    return result.requireValue;
  }

  Future<void> _runSignOut({
    required String startMessage,
    required String successMessage,
    required String errorMessage,
    required Future<void> Function(AuthRepository repo) signOutAction,
  }) async {
    state = const AsyncLoading<UserResponse?>();

    developer.log(startMessage, name: 'AuthFlow', level: 800);

    final result = await AsyncValue.guard<UserResponse?>(() async {
      await signOutAction(ref.read(authRepositoryProvider));
      return null;
    });

    if (result.hasError) {
      developer.log(
        errorMessage,
        name: 'AuthFlow',
        error: result.error,
        stackTrace: result.stackTrace,
        level: 1000,
      );
    } else {
      developer.log(successMessage, name: 'AuthFlow', level: 800);
    }

    state = result;
  }
}
