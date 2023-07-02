import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_track/src/common_widgets/common_padding.dart';
import 'package:wallet_track/src/features/settings/widgets/info_list_tile_widget.dart';
import 'package:wallet_track/src/features/settings/widgets/theme_list_tile_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: false,
        title: const Text('Configurações'),
      ),
      body: CommonPadding(
        child: ListView(
          children: const <Widget>[
            ThemeListTileWidget(),
            InfoListTileWidget(),
          ],
        ),
      ),
    );
  }
}
