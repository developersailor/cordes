import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordes/core/enum/viewstate.dart';
import 'package:cordes/core/models/user_request_model.dart';
import 'package:cordes/core/services/authentication_service.dart';
import 'package:cordes/core/services/request_services.dart';
import 'package:cordes/core/viewmodels/base_view_model.dart';
import 'package:cordes/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestAddViewModel extends BaseViewModel {
  static CollectionReference userProfile =
      FirebaseFirestore.instance.collection('userProfile');
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final UserRequest _userRequest = UserRequest();
  UserRequest get userRequest => _userRequest;
  final AuthenticationService _authenticationService = AuthenticationService();
  final RequestAddServices _requestAddServices = RequestAddServices();
  dropDownDone(String? value) {
    setViewState(ViewState.Busy);
    _userRequest.requestType = value;
    setViewState(ViewState.Idle);
  }

  deleteRequest(String reqNum) async {
    setViewState(ViewState.Busy);
    await locator<RequestAddServices>().deleteRequest(reqNum);
    setViewState(ViewState.Idle);
  }

  createRequest(String? requestType, String requestDescription) async {
    setViewState(ViewState.Busy);
    String? getDataPhoneNumber;
    String? getDataDisplayName;
    if (_authenticationService.currentUser?.uid != null) {
      var profile = await userProfile
          .doc(firebaseAuth.currentUser?.uid)
          .get()
          .then((value) {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        return data;
      });
      getDataPhoneNumber = profile['phoneNumber'];
      getDataDisplayName = profile['userName'] + profile['surName'];
      _requestAddServices.createRequest(
          UserRequest(
            uid: _authenticationService.currentUser?.uid,
            requestType: requestType,
            requestDescription: requestDescription,
            decision: '',
            approvalStatus: 'beklemede',
          ),
          getDataDisplayName,
          getDataPhoneNumber);
    }
    setViewState(ViewState.Idle);
  }
}
