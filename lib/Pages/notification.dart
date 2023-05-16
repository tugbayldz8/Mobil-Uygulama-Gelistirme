import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:grock/grock.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;
  void settingNotifivatiob() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
    print("${settings.authorizationStatus}");
  }

  void connectNotgication() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    settingNotifivatiob();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(
          title: "${event.notification?.title}",
          description: "${event.notification?.body}",
          position: SnackbarPosition.top);

      print("Gelen bildirim:${event.notification?.title}");
    });
    messaging.getToken().then((token) {
      print('***********************************************Token: $token');
    });
  }
}
