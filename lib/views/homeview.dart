import 'package:flutter/material.dart';
import 'package:push_notification/services/notification_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.firebaseInit();
    notificationService.getDeviceToken().then((value) {
      print("device token: ");
      print(value);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Notification"),
      ),
    );
  }
}
