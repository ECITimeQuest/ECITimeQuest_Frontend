import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/features/auth/data/datasources/firebase_auth_data_source.dart';
import 'package:flutter_app/features/auth/data/datasources/backend_auth_data_source.dart';
import 'package:flutter_app/features/auth/data/models/user_response.dart';

class AuthRepository {
  final FirebaseAuthDataSource _firebaseDataSource;
  final BackendAuthDataSource _backendDataSource;

  AuthRepository(this._firebaseDataSource, this._backendDataSource);

  Future<UserCredential> signUpWithCredentials(String email, String password) {
    return _firebaseDataSource.signUpWithCredentials(email, password);
  }

  Future<UserCredential> signInWithCredentials(String email, String password) {
    return _firebaseDataSource.signInWithCredentials(email, password);
  }

  Future<void> signOut() {
    return _firebaseDataSource.signOut();
  }

  Future<UserCredential> signInWithGoogle() {
    return _firebaseDataSource.signInWithGoogle();
  }

  Future<void> signOutGoogle() {
    return _firebaseDataSource.signOutGoogle();
  }

  Future<UserResponse> syncUser() {
    return _backendDataSource.syncUser();
  }

  Future<UserResponse> getMe() {
    return _backendDataSource.getMe();
  }
}
