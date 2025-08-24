import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../settingpage/cubit2/languge_cubit.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Language")),
      body: BlocBuilder<LangugeCubit, Locale>(
        builder: (context, state) {
          final languageCubit = context.read<LangugeCubit>();
          return ListView(
            children: [
              buildLanguageTile(
                context,
                title: "English",
                locale: const Locale('en'),
                selected: state.languageCode == "en",
                cubit: languageCubit,
              ),
              buildLanguageTile(
                context,
                title: "हिन्दी (Hindi)",
                locale: const Locale('hi'),
                selected: state.languageCode == "hi",
                cubit: languageCubit,
              ),
              buildLanguageTile(
                context,
                title: "മലയാളം (Malayalam)",
                locale: const Locale('ml'),
                selected: state.languageCode == "ml",
                cubit: languageCubit,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildLanguageTile(
      BuildContext context, {
        required String title,
        required Locale locale,
        required bool selected,
        required LangugeCubit cubit,
      }) {
    return ListTile(
      title: Text(title),
      trailing: selected ? const Icon(Icons.check, color: Colors.green) : null,
      onTap: () {
        cubit.changeLocale(locale);
        Navigator.pop(context);
      },
    );
  }
}
