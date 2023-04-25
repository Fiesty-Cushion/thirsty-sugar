import 'package:attendy/features/auth/controller/auth_controller.dart';
import 'package:attendy/features/auth/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  void onLogOut() {
    ref.read(authControllerProvider.notifier).logOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MyButton(
      onPressed: () async {
        onLogOut();
      },
      buttonText: 'Sing Out',
      isLoading: false,
    ));
  }
}
