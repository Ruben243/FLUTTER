import 'package:flutter/material.dart';
import 'package:push_notification/pantallas/pantallas.dart';
import 'package:push_notification/services/push_notifications_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengetKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    // context
    PushNotificationsService.messagesStream.listen((message) {
      navigatorKey.currentState?.pushNamed('mensaje', arguments: message);
      final snackBar = SnackBar(content: Text(message));
      messengetKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push Notification',
      initialRoute: 'home',
      navigatorKey: navigatorKey, //navegar
      scaffoldMessengerKey: messengetKey, //Snacks
      routes: {
        'home': (_) => const HomeScreen(),
        'mensaje': (_) => const MensajeScreen(),
      },
    );
  }
}
