import 'package:appwrite/models.dart';
import 'package:attendy/apis/auth_api.dart';
import 'package:attendy/core/utils.dart';
import 'package:attendy/features/auth/view/login_view.dart';
import 'package:attendy/features/home/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  //state = isloading

  Future<User?> currentUser() => _authAPI.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => showSnackBar(context, 'Account Created Successfully!'),
    );
  }

  void logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.logIn(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => Navigator.pushReplacement(context, HomeView.route()),
    );
  }

  void logOut(BuildContext context) async {
    final res = await _authAPI.logOut();
    res.fold(
      (l) => null,
      (r) => Navigator.pushAndRemoveUntil(context, LoginView.route(), (route) => false)
    );
  }
}
















