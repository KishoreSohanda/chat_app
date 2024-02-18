import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handle(RemoteMessage remoteMessage) async {
  // print(remoteMessage.notification?.title.toString());
  // print(remoteMessage.notification?.body);
  // print(remoteMessage.data);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifictaions() async {
    await _firebaseMessaging.requestPermission();
    // FirebaseMessaging.onMessage.listen((message) {
    //   print(message);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((msg) {
    //   print(msg.data);
    // });
    // final fcmToken = await _firebaseMessaging.getToken();
    // print('"${fcmToken}"');

    // FirebaseMessaging.onBackgroundMessage(handle);
  }
}
