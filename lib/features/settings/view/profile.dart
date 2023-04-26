import 'package:attendy/features/auth/controller/auth_controller.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

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
    bool isSwitchOn = false;
    return Container(
      color: HexColor('#F0F0F0'),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            BigUserCard(
              backgroundColor: HexColor('#F44133'),
              userName: "Fiesty Cushion",
              userProfilePic: const NetworkImage('https://pbs.twimg.com/profile_images/1423537244220968963/HHT7Mg8l_400x400.jpg'),
              cardActionWidget: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SettingsItem(
                  backgroundColor: Colors.white,
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Modify",
                  subtitle: "Tap to change your data",
                  onTap: () {},
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
            SettingsGroup(
              items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.brush_sharp,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.blueGrey
                    ),
                    title: 'Appearance',
                    subtitle: "Make the App yours",
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.grey.shade900,
                  ),
                  title: 'Dark mode',
                  subtitle: "Automatic",
                  trailing: Switch.adaptive(
                    value: isSwitchOn,
                    onChanged: (newValue) {
                      setState(() {
                        isSwitchOn = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about the App",
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  title: "Sign Out",
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor: Colors.black,
                  ),
                  title: "Delete account",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
