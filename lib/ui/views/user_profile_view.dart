import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordes/core/services/authentication_service.dart';
import 'package:cordes/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:cordes/core/viewmodels/user_profile_view_model.dart';

//bug fix
class UserProfileView extends StatefulWidget {
  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  static final _formKey = GlobalKey<FormState>();
  static TextEditingController _userName = TextEditingController();
  static TextEditingController _surName = TextEditingController();
  static TextEditingController _identity = TextEditingController();
  static TextEditingController _address = TextEditingController();
  static TextEditingController _phoneNumber = TextEditingController();
  static TextEditingController _email = TextEditingController();
  static CollectionReference _userProfile =
      FirebaseFirestore.instance.collection('userProfile');
  static AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        body: BaseView<UserProfileViewModel>(
            onModelReady: (p0) {
              if (_authenticationService.currentUser?.uid != null) {
                _userProfile
                    .doc(_authenticationService.currentUser?.uid)
                    .get()
                    .then((value) {
                  Map<String, dynamic> data =
                      value.data() as Map<String, dynamic>;
                  setState(() {
                    _userName.text = data['userName'];
                    _surName.text = data['surName'];
                    _identity.text = data['identity'];
                    _address.text = data['address'];
                    _phoneNumber.text = data['phoneNumber'];
                    _email.text = data['email'];
                    p0.profile.acceptTheContracts = data['acceptTheContracts'];
                  });
                });
              }
            },
            builder: (BuildContext context, UserProfileViewModel data,
                    Widget? child) =>
                data.profile.acceptTheContracts == false ||
                        data.profile.acceptTheContracts == null
                    ? SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      onChanged: (value) {
                                        data.profile.email = value;
                                      },
                                      controller: _email,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "email",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        data.profile.userName = value;
                                      },
                                      controller: _userName,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Ad",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        data.profile.surName = value;
                                      },
                                      controller: _surName,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Soyad",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        data.profile.identity = value;
                                      },
                                      controller: _identity,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "TC kimlik",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        data.profile.address = value;
                                      },
                                      controller: _address,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Adres",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        data.profile.phoneNumber = value;
                                      },
                                      controller: _phoneNumber,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Cep telefonu",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                      child: ListTile(
                                        title: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/privacyagreement');
                                          },
                                          child: Text(
                                              'Üyelik sözleşmelerini okudum ve kabul ediyorum.',
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32.0)),
                                      child: TextButton.icon(
                                        onPressed: () {
                                          print(" kayıt ol ");
                                          if (_formKey.currentState!
                                              .validate()) {
                                            data.createDone(
                                                userName: _userName.text,
                                                surName: _surName.text,
                                                identity: _identity.text,
                                                address: _address.text,
                                                phoneNumber: _phoneNumber.text,
                                                acceptTheContract: true,
                                                email: _email.text);
                                            _formKey.currentState!.save();
                                            Navigator.pushReplacementNamed(
                                                context, '/');
                                          }
                                        },
                                        icon: Icon(
                                          Icons.save,
                                          size: 20,
                                        ),
                                        label: Text("Kayıt Ol"),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      )
                    : data.profile.acceptTheContracts == true
                        ? StreamBuilder<QuerySnapshot>(
                            stream: _userProfile
                                .where("uid",
                                    isEqualTo:
                                        _authenticationService.currentUser?.uid)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("Loading");
                              }
                              return ListView(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> dataSnapshot =
                                      document.data() as Map<String, dynamic>;
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          dataSnapshot['userName'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: Text(
                                          dataSnapshot['surName'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        trailing: Text(
                                          dataSnapshot['address'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      Color.fromRGBO(
                                                          98, 0, 238, 1))),
                                          onPressed: () {
                                            data.updateContracts(false);
                                            Navigator.pushNamed(context, "/");
                                          },
                                          child: Text(
                                            'Düzenle',
                                            style: TextStyle(
                                                backgroundColor: Color.fromRGBO(
                                                    98, 0, 238, 1)),
                                          ))
                                    ],
                                  );
                                }).toList(),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          )));
  }
}
