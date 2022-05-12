import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:bookmarker1/Page/Settings/notification_page.dart';
import 'package:bookmarker1/Page/Settings/header_page.dart';
import 'package:bookmarker1/Page/Settings/account_page.dart';
import 'package:bookmarker1/Widget/icon_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              HeaderPage(),
              SettingsGroup(
                title: 'General',
                children: [
                  AccountPage(),
                  NotificationPage(),
                  buildLogout(),
                  buildDeleteAccount(),
                ],
              ),
              const SizedBox(height: 32),
              buildReportBug(context),
              buildSendFeedback(context),
            ],
          ),
        ),
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(icon: Icons.logout, color: Colors.lightBlue),
        onTap: () => FirebaseAuth.instance.signOut(),
      );

  Widget buildDeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(icon: Icons.delete, color: Colors.pink),
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User deletes account'),
          ),
        ),
      );
  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
        title: 'Report A Bug',
        subtitle: '',
        leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Clicked Report A Bug'),
          ),
        ),
      );
  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
        title: 'Send Feedback',
        subtitle: '',
        leading: IconWidget(icon: Icons.thumbs_up_down, color: Colors.purple),
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Clicked SendFeedback'),
          ),
        ),
      );
}
