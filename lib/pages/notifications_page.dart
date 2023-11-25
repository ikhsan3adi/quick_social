import 'package:flutter/material.dart';
import 'package:quick_social/models/models.dart';
import 'package:quick_social/widgets/notification_tile.dart';
import 'package:quick_social/widgets/widgets.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with AutomaticKeepAliveClientMixin {
  late List<UserNotification> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = UserNotification.dummyNotifications;
  }

  void readAll() => setState(() {
        _notifications = _notifications.map((e) {
          return e.copyWith(isRead: true);
        }).toList();
      });

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: ResponsivePadding(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifikasi', style: textTheme.headlineSmall),
                  TextButton.icon(
                    onPressed: readAll,
                    icon: const Icon(Icons.check),
                    label: const Text('Tandai telah dibaca'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ResponsivePadding(
        child: ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (_, index) {
            return NotificationTile(notification: _notifications[index]);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
