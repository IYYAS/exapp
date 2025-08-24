import 'package:exapp/mainpage/dashboard/addimagepage/component/settingpage/component/languagechage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../settingpage/cubit/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context
        .watch<ThemeCubit>()
        .state == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(

        title: Text(AppLocalizations.of(context)!.setting,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            )),
        actions: [
          Icon(Icons.more_vert, color: Theme.of(context).iconTheme.color),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔍 Search Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffB86ACA)
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.search,),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 🔹 Account Settings
          Text(AppLocalizations.of(context)!.accountSettings,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, )),
          const SizedBox(height: 8),

          buildSettingTile(
            title: AppLocalizations.of(context)!.changePassword,
            icon: Icons.arrow_forward_ios,
            onTap: () {},
          ),
          buildSettingTile(
            title: AppLocalizations.of(context)!.addPaymentMethod,
            icon: Icons.add,
            onTap: () {},
          ),
          buildSwitchTile(AppLocalizations.of(context)!.pushNotifications, true,),
          buildSwitchTile(AppLocalizations.of(context)!.darkMode, isDark,(val) {
            context.read<ThemeCubit>().toggleTheme(val);
          } ),
          buildSettingTile(
            title:AppLocalizations.of(context)!.language,
            icon: Icons.arrow_forward_ios,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LanguagePage()),
              );
            },
          ),

          const SizedBox(height: 20),

          // 🔹 Privacy & Security
           Text(AppLocalizations.of(context)!.privacyAndSecurity,
              style: TextStyle(
                  fontWeight: FontWeight.bold, )),
          const SizedBox(height: 8),

          buildSettingTile(
            title: AppLocalizations.of(context)!.privacySettings,
            icon: Icons.arrow_forward_ios,
            onTap: () {},
          ),
          buildSettingTile(
            title: AppLocalizations.of(context)!.twoFactorAuthentication,
            icon: Icons.add,
            onTap: () {},
          ),

          const SizedBox(height: 20),

          // 🔹 App Preferences
           Text(AppLocalizations.of(context)!.appPreferences,
              style: TextStyle(
                  fontWeight: FontWeight.bold, )),
          const SizedBox(height: 8),

          buildSwitchTile(AppLocalizations.of(context)!.autoplayVideos,true),
        ],
      ),
    );
  }

  // 🔹 Helper for Normal Setting Item
  Widget buildSettingTile(
      {required String title, required IconData icon, required Function() onTap}) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon, size: 20,),
      onTap: onTap,
    );
  }

  // 🔹 Helper for Switch Item
  Widget buildSwitchTile(String title, bool value,
      [Function(bool)? onChanged]) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Color(0xffFFFFFF),
      activeTrackColor: Color(0xffEAEAEA),
      inactiveThumbColor: Color(0xffFFFFFF),
      inactiveTrackColor: Color(0xffB86ACA),

    );
  }
}
