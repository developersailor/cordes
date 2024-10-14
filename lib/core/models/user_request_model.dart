class UserRequest {
  int? requestNumber;
  String? requestType;
  String? requestDescription;
  String? uid;
  bool? isDeleted;
  String? decision = '';
  String? approvalStatus;
  UserRequest({
    this.requestType,
    this.requestDescription,
    this.uid,
    this.decision,
    this.approvalStatus,
  });
}
