import 'package:cordes/core/models/user_profile_model.dart';
import 'package:cordes/core/services/user_profile_service.dart';
import '../enum/viewstate.dart';
import '../models/user_profile_model.dart';
import 'base_view_model.dart';

class UserProfileViewModel extends BaseViewModel {
  final UserProfileModel _profile = UserProfileModel();
  UserProfileModel get profile => _profile;
  final UserProfileService _userProfileService = UserProfileService();

  void createDone(
      {String? userName,
      String? surName,
      String? identity,
      String? address,
      String? phoneNumber,
      bool? acceptTheContract,
      String? email}) {
    setViewState(ViewState.Busy);
    _userProfileService.createUserProfile(UserProfileModel(
        userName: userName,
        surName: surName,
        identity: identity,
        address: address,
        phoneNumber: phoneNumber,
        email: email,
        acceptTheContracts: acceptTheContract));
    setViewState(ViewState.Idle);
  }

  void updateContracts(bool acceptTheContracts) {
    setViewState(ViewState.Busy);
    _userProfileService.updateContracts(acceptTheContracts);
    setViewState(ViewState.Idle);
  }
}
