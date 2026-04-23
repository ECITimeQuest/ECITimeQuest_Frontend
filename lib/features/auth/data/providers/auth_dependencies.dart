import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/core/network/dio_client_provider.dart';
import 'package:flutter_app/features/auth/data/datasources/backend_auth_data_source.dart';
import 'package:flutter_app/features/auth/data/datasources/firebase_auth_data_source.dart';
import 'package:flutter_app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final firebaseAuthProvider = Provider<FirebaseAuthDataSource>((ref) {
  return FirebaseAuthDataSource(FirebaseAuth.instance, GoogleSignIn.instance);
});

final backendAuthProvider = Provider<BackendAuthDataSource>((ref) {
  return BackendAuthDataSource(ref.watch(dioProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(firebaseAuthProvider),
    ref.watch(backendAuthProvider),
  );
});
