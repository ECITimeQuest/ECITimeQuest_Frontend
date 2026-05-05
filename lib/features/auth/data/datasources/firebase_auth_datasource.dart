import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app/core/network/api_exception.dart';
import 'package:flutter_app/core/network/dio_exception_mapper.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final DioExceptionMapper _exceptionMapper;

  FirebaseAuthDataSource(
    this.firebaseAuth,
    this.googleSignIn, {
    DioExceptionMapper? exceptionMapper,
  }) : _exceptionMapper = exceptionMapper ?? const DioExceptionMapper();

  // Authentication with email and password
  Future<UserCredential> signUpWithCredentials(
    String email,
    String password,
  ) async {
    return _runEmailAuthFlow(
      startMessage: 'Iniciando registro con correo y contraseña',
      successMessage: 'Registro con correo y contraseña exitoso',
      firebaseErrorMessage: 'Error en registro con correo y contraseña',
      unexpectedErrorMessage:
          'Error inesperado en registro con correo y contraseña',
      action: () => firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
      firebaseErrorMapper: _mapSignUpException,
    );
  }

  Future<UserCredential> signInWithCredentials(
    String email,
    String password,
  ) async {
    return _runEmailAuthFlow(
      startMessage: 'Iniciando inicio de sesión con correo y contraseña',
      successMessage: 'Inicio de sesión con correo y contraseña exitoso',
      firebaseErrorMessage: 'Error en inicio de sesión con correo y contraseña',
      unexpectedErrorMessage:
          'Error inesperado en inicio de sesión con correo y contraseña',
      action: () => firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      firebaseErrorMapper: _mapSignInException,
    );
  }

  Future<void> signOut() async {
    return _runSignOutFlow(
      startMessage: 'Cerrando sesión (correo y contraseña)',
      action: () => firebaseAuth.signOut(),
    );
  }

  // Authentication with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      developer.log(
        'Iniciando autenticación con Google',
        name: 'FirebaseAuthDataSource',
        level: 800,
      );

      await googleSignIn.initialize(
        serverClientId:
            '453892699571-aoh340qsl5emu6sfekvp0bcq07gpqrtp.apps.googleusercontent.com',
      );

      final googleUser = await googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      developer.log(
        'Autenticación con Google exitosa',
        name: 'FirebaseAuthDataSource',
        level: 800,
      );

      return userCredential;
    } on DioException catch (e, stackTrace) {
      developer.log(
        'Error Dio en login con Google',
        name: 'FirebaseAuthDataSource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw _exceptionMapper.map(e);
    } catch (e, stackTrace) {
      developer.log(
        'Error inesperado en login con Google',
        name: 'FirebaseAuthDataSource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw ApiException(message: e.toString());
    }
  }

  Future<void> signOutGoogle() async {
    return _runSignOutFlow(
      startMessage: 'Cerrando sesión (Google + Firebase)',
      action: () async {
        await googleSignIn.disconnect();
        await firebaseAuth.signOut();
      },
    );
  }

  // Helpers for auth flows
  Future<UserCredential> _runEmailAuthFlow({
    required String startMessage,
    required String successMessage,
    required String firebaseErrorMessage,
    required String unexpectedErrorMessage,
    required Future<UserCredential> Function() action,
    required ApiException Function(FirebaseAuthException e) firebaseErrorMapper,
  }) async {
    try {
      developer.log(startMessage, name: 'FirebaseAuthDataSource', level: 800);

      final credential = await action();

      developer.log(successMessage, name: 'FirebaseAuthDataSource', level: 800);

      return credential;
    } on FirebaseAuthException catch (e) {
      developer.log(
        firebaseErrorMessage,
        name: 'FirebaseAuthDataSource',
        error: e,
        level: 1000,
      );
      throw firebaseErrorMapper(e);
    } catch (e, stackTrace) {
      developer.log(
        unexpectedErrorMessage,
        name: 'FirebaseAuthDataSource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw ApiException(message: e.toString());
    }
  }

  ApiException _mapSignUpException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return const ApiException(message: 'La contraseña es demasiado débil.');
      case 'email-already-in-use':
        return const ApiException(
          message: 'Este correo electrónico ya está registrado.',
        );
      case 'invalid-email':
        return const ApiException(
          message: 'El formato del correo no es válido.',
        );
      case 'network-request-failed':
        return const ApiException(
          message: 'No hay conexión a internet. Verifica tu red.',
        );
      default:
        return ApiException(
          message: 'Error al registrar: ${e.message ?? e.code}',
        );
    }
  }

  ApiException _mapSignInException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
      case 'user-disabled':
        return const ApiException(message: 'Correo o contraseña incorrectos.');
      case 'network-request-failed':
        return const ApiException(
          message: 'Servicio no disponible. Revisa tu conexión.',
        );
      case 'too-many-requests':
        return const ApiException(
          message: 'Demasiados intentos. Inténtalo más tarde.',
        );
      default:
        return ApiException(
          message: 'Error al iniciar sesión: ${e.message ?? e.code}',
        );
    }
  }

  Future<void> _runSignOutFlow({
    required String startMessage,
    required Future<void> Function() action,
  }) async {
    try {
      developer.log(startMessage, name: 'FirebaseAuthDataSource', level: 800);

      await action();

      developer.log(
        'Sesión cerrada correctamente',
        name: 'FirebaseAuthDataSource',
        level: 800,
      );
    } on DioException catch (e, stackTrace) {
      developer.log(
        'Error Dio al cerrar sesión',
        name: 'FirebaseAuthDataSource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw _exceptionMapper.map(e);
    } catch (e, stackTrace) {
      developer.log(
        'Error inesperado al cerrar sesión',
        name: 'FirebaseAuthDataSource',
        error: e,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw ApiException(message: e.toString());
    }
  }
}
