import 'package:cordes/core/services/authentication_service.dart';
import 'package:cordes/core/services/firebase_cloud_messaging.dart';
import 'package:cordes/core/services/request_services.dart';
import 'package:cordes/core/services/user_profile_service.dart';
import 'package:cordes/core/viewmodels/login_view_model.dart';
import 'package:cordes/core/viewmodels/home_view_model.dart';
import 'package:cordes/core/viewmodels/request_add_view_model.dart';
import 'package:cordes/core/viewmodels/request_view_model.dart';

import 'package:cordes/core/viewmodels/survey_view_model.dart';
import 'package:cordes/core/viewmodels/user_profile_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => UserProfileService());
  locator.registerLazySingleton(() => RequestAddServices());
  locator.registerLazySingleton(() => MessagingService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => UserProfileViewModel());
  locator.registerFactory(() => SurveyViewModel());
  locator.registerFactory(() => RequestViewModel());
  locator.registerFactory(() => RequestAddViewModel());
}
