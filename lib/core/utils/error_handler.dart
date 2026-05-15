import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/core/network/api_exception.dart';

class ErrorHandler {
  static String getMessage(Object error) {
    if (error is ApiException) {
      return error.message;
    }

    if (error is FirebaseAuthException) {
      return error.message ?? 'Error de autenticación';
    }

    return 'Ocurrió un error inesperado. Inténtalo de nuevo.';
  }
}
