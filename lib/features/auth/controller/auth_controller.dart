import 'package:appwrite/models.dart';
import 'package:attendy/apis/auth_api.dart';
import 'package:attendy/apis/user_api.dart';
import 'package:attendy/core/utils.dart';
import 'package:attendy/features/auth/view/login_view.dart';
import 'package:attendy/features/home/view/home_view.dart';
import 'package:attendy/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authAPI: ref.watch(authAPIProvider), userAPI: ref.watch(userAPIProvider));
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;

  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
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
      (r) async {
        UserModel userModel = UserModel(
          userName: getUsernameFromEmail(email),
          email: email,
          profilePic: '',
          uid: r.$id,
        );
        final res2 = await _userAPI.saveUserData(userModel);
        res2.fold((l) => showSnackBar(context, l.message),
            (r) => showSnackBar(context, 'Account Created Successfully!'));
      },
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
        (r) => Navigator.pushAndRemoveUntil(
            context, LoginView.route(), (route) => false));
  }
}
