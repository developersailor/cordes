import 'package:cordes/ui/views/privacy_agreement.dart';
import 'package:cordes/ui/views/request_add_view.dart';
import 'package:cordes/ui/views/request_status_view.dart';
import 'package:flutter/material.dart';
import 'package:cordes/ui/views/login_view.dart';
import 'package:cordes/ui/views/home_view.dart';
import 'package:cordes/ui/views/user_profile_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/register':
        return MaterialPageRoute(builder: (_) => UserProfileView());
      case '/requestaddview':
        return MaterialPageRoute(builder: (_) => RequestAddView());
      case '/userprofile':
        return MaterialPageRoute(builder: (_) => UserProfileView());
      case '/privacyagreement':
        return MaterialPageRoute(builder: (_) => PrivacyAgreement());
      case '/requeststatus':
        return MaterialPageRoute(builder: (_) => RequestStatusView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
