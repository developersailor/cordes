import 'package:cordes/core/services/authentication_service.dart';
import 'package:cordes/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import './ui/router.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      initialData: locator<AuthenticationService>().myCurrentUser(),
      stream: locator<AuthenticationService>().onAuthStateChanged(),
      builder: (context, AsyncSnapshot<User?> snapshot) =>
          Consumer<User?>(builder: (context, user, Widget? child) {
        return MaterialApp(
          title: 'Corona Helper',
          initialRoute: user == null ? '/login' : '/',
          onGenerateRoute: AppRouter.generateRoute,
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(98, 0, 238, 1),
            backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        );
      }),
    );
  }
}
