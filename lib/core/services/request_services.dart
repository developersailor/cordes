import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordes/core/models/user_request_model.dart';
import 'package:uuid/uuid.dart';

class RequestAddServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void createRequest(
      UserRequest userRequest, String? displayName, String? phoneNumber) {
    const uuid = Uuid();
    final reqNum = uuid.v1();
    _firestore.collection('userRequests').doc().set({
      'createdAt': DateTime.now(),
      'requestNumber': reqNum,
      'uid': userRequest.uid,
      'requestType': userRequest.requestType,
      'requestDescription': userRequest.requestDescription,
      'isDeleted': false,
      'displayName': displayName,
      'approvalStatus': userRequest.approvalStatus,
      'decision': userRequest.decision,
      'phoneNumber': phoneNumber
    });
  }

  Future<void> deleteRequest(String reqNum) async {
    await _firestore
        .collection('userRequests')
        .doc(reqNum)
        .update({'isDeleted': true});
  }
}
