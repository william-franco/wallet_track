import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_track/src/routes/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Wallet Track',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                context.pop();
                context.push(Routes.settings);
              },
            ),
          ],
        ),
      ),
    );
  }
}
