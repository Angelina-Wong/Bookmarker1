import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookmarker1/Page/Settings/settings_page.dart';
import 'package:bookmarker1/Page/share_page.dart';
import 'package:bookmarker1/Menu/menu_items.dart';
import 'package:bookmarker1/Menu/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future loadSettings() async {
//   await Settings.init(cacheProvider: SharePreferenceCache());
// }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarker'),
        actions: [
          PopupMenuButton<MenuModel>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItem.itemFirst.map(buildItem).toList(),
              PopupMenuDivider(),
              ...MenuItem.itemSecond.map(buildItem).toList(),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Signed in as',
              style: TextStyle(fontSize: 15.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton.icon(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.arrow_back, size: 32),
              label: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 23),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<MenuModel> buildItem(MenuModel item) =>
      PopupMenuItem<MenuModel>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black45, size: 15),
            const SizedBox(width: 10),
            Text(item.text),
          ],
        ),
      );

  void onSelected(BuildContext context, MenuModel item) {
    switch (item) {
      case MenuItem.itemSettings:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
      case MenuItem.itemShare:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SharePage()),
        );
        break;
      case MenuItem.itemSignOut:
        FirebaseAuth.instance.signOut();
    }
  }
}
