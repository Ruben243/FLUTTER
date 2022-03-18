// https://www.postman.com/lively-moon-541169/workspace/purego-apis/documentation/16545848-bcf732a1-7e42-44e7-aa6c-333b542516e1
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream = StreamController();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    _messageStream.add(message.data['product'] ?? 'No Date');
  }

  static Future<void> _onMessagedHandler(RemoteMessage message) async {
    _messageStream.add(message.data['product'] ?? 'No Date');
  }

  static Future<void> _onMessageOpenapp(RemoteMessage message) async {
    _messageStream.add(message.data['product'] ?? 'No Date');
  }

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    // handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessagedHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenapp);
  }

  static closesStreams() {
    _messageStream.close();
  }
}
