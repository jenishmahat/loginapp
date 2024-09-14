import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationItem(
              title: 'You have spent more this month',
              subtitle: 'Your Shopping budget has exceeded the limit...',
              amount: '29.00',
            ),
            _buildNotificationItem(
              title: 'Utilities budget has exceeded the limit',
              subtitle: 'Your Utilities budget has exceeded the limit...',
              amount: '30.00',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
      {required String title,
      required String subtitle,
      required String amount}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text('\$$amount', style: const TextStyle(color: Colors.red)),
    );
  }
}
