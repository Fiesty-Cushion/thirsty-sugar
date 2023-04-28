import 'package:attendy/core/utils.dart';
import 'package:attendy/features/auth/controller/auth_controller.dart';
import 'package:attendy/features/settings/widgets/settings_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  void onLogOut() {
    ref.read(authControllerProvider.notifier).logOut(context);
  }

  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card
          BigUserCard(
            backgroundColor: HexColor('#F44133'),
            userName: "Fiesty Cushion",
            userProfilePic: const NetworkImage(
                'https://pbs.twimg.com/profile_images/1423537244220968963/HHT7Mg8l_400x400.jpg'),
            cardActionWidget: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  child: SettingsItem(
                    icons: Icons.edit_outlined,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.white,
                      iconsColor: Colors.black,
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
            ),
          ),
          MySettingsGroup(
            items: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    child: SettingsItem(
                      onTap: () {},
                      icons: Icons.brush_rounded,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.white,
                        iconsColor: Colors.black,
                      ),
                      title: 'Appearance',
                      subtitle: "Make the App yours",
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    child: SettingsItem(
                      onTap: () {
                        setState(() {
                          isSwitchOn = !isSwitchOn;
                        });
                      },
                      icons: Icons.dark_mode_outlined,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.white,
                        iconsColor: Colors.black,
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
                  ),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Material(
              color: Colors.white,
              child: InkWell(
                child: SettingsItem(
                  onTap: () {},
                  icons: Icons.info_outline_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.white,
                    iconsColor: Colors.black,
                  ),
                  title: 'About',
                  subtitle: "Learn more about the App",
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          // You can add a settings title
          MySettingsGroup(
            settingsGroupTitle: "Account",
            items: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    child: SettingsItem(
                      onTap: () {
                        showQuickAlert(context, onLogOut);
                      },
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
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    child: SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.white,
                        iconsColor: Colors.black,
                      ),
                      title: "Delete account",
                      titleStyle: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
