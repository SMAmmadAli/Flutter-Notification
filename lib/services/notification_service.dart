import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user give permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user give provisinal permission");
    } else {
      print("user don't give permission");
    }
  }

  //FCM Token or Device Token

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }
}
