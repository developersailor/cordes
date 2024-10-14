import 'package:cordes/core/services/authentication_service.dart';
import 'package:cordes/core/services/firebase_cloud_messaging.dart';
import 'package:cordes/core/viewmodels/base_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import '../../locator.dart';
import '../enum/viewstate.dart';

class HomeViewModel extends BaseViewModel {
  int currentIndex = 0;
  final getIt = GetIt.instance;
  setCurrentIndex(int index) {
    setViewState(ViewState.Busy);
    currentIndex = index;
    setViewState(ViewState.Idle);
  }

  logOut() {
    setViewState(ViewState.Busy);
    getIt<AuthenticationService>().signOut();
    setViewState(ViewState.Idle);
  }

  token() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      locator<MessagingService>().saveTokenToDatabase(token);
    }
    // Save the initial token to the database

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh
        .listen(locator<MessagingService>().saveTokenToDatabase);
  }
}
