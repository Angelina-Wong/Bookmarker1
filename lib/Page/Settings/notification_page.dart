import 'package:flutter/material.dart';
import 'package:bookmarker1/Widget/icon_widget.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  static const keyNews = 'key-news';
  static const keyActivity = 'key-activity';
  static const keyNewsletter = 'key-newsletter';
  static const keyAppUpdates = 'key-appUpdates';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Notifications',
        subtitle: 'Newsletter, App Updates',
        leading: IconWidget(icon: Icons.notifications, color: Colors.amber),
        child: SettingsScreen(
          title: 'Notification',
          children: <Widget>[
            buildNews(),
            buildActivity(),
            buildNewsletter(),
            buildAppUpdates(),
          ],
        ),
      );

  Widget buildNews() => SwitchSettingsTile(
        settingKey: keyNews,
        leading: IconWidget(icon: Icons.message, color: Colors.blueAccent),
        title: 'News for you',
      );
  Widget buildActivity() => SwitchSettingsTile(
        settingKey: keyActivity,
        leading: IconWidget(icon: Icons.person, color: Colors.orangeAccent),
        title: 'Account Activity',
      );
  Widget buildNewsletter() => SwitchSettingsTile(
        settingKey: keyNewsletter,
        leading: IconWidget(icon: Icons.text_snippet, color: Colors.pinkAccent),
        title: 'Newsletter',
      );
  Widget buildAppUpdates() => SwitchSettingsTile(
        settingKey: keyAppUpdates,
        leading: IconWidget(icon: Icons.update, color: Colors.greenAccent),
        title: 'App Updates',
      );
}
