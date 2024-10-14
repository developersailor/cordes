import 'package:firebase_auth/firebase_auth.dart';

class UserProfileModel {
  UserProfileModel(
      {this.userName,
      this.surName,
      this.uid,
      this.identity,
      this.address,
      this.phoneNumber,
      this.acceptTheContracts,
      this.email});
  User? loggedInUser;
  String? userName;
  String? surName;
  String? uid;
  String? identity;
  String? address;
  String? phoneNumber;
  String? email;
  bool? acceptTheContracts;
}
