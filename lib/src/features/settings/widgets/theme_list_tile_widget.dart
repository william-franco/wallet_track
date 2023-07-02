// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:wallet_track/src/features/settings/view_models/setting_view_model.dart';

class ThemeListTileWidget extends StatelessWidget {
  const ThemeListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<SettingViewModel>().value;
    return ListTile(
      leading: const Icon(Icons.brightness_6_outlined),
      title: const Text('Tema escuro'),
      trailing: Switch(
        value: isDarkTheme,
        onChanged: (bool enabled) {
          context.read<SettingViewModel>().updateTheme(isDarkTheme: enabled);
        },
      ),
    );
  }
}
