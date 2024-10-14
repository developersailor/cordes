import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordes/core/models/user_profile_model.dart';
import 'package:cordes/core/services/authentication_service.dart';

import '../models/user_profile_model.dart';

class UserProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthenticationService _authenticationService = AuthenticationService();

  void createUserProfile(UserProfileModel profile) {
    final user = _authenticationService.myCurrentUser();
    _firestore.collection('userProfile').doc(user?.uid).set({
      'acceptTheContracts': profile.acceptTheContracts,
      'userName': profile.userName,
      'surName': profile.surName,
      'identity': profile.identity,
      'address': profile.address,
      'phoneNumber': profile.phoneNumber,
      'uid': user?.uid,
      'email': profile.email
    });
  }

  void updateContracts(bool acceptTheContracts) {
    final user = _authenticationService.myCurrentUser();
    _firestore.collection('userProfile').doc(user?.uid).update({
      'acceptTheContracts': acceptTheContracts,
    });
  }
}
