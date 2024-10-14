import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordes/core/services/authentication_service.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class RequestStatusView extends StatefulWidget {
  const RequestStatusView({Key? key}) : super(key: key);

  @override
  State<RequestStatusView> createState() => _RequestStatusViewState();
}

class _RequestStatusViewState extends State<RequestStatusView> {
  @override
  Widget build(BuildContext context) {
    AuthenticationService _auth = locator<AuthenticationService>();
    final CollectionReference _userRequests =
        FirebaseFirestore.instance.collection('userRequests');
    return StreamBuilder<QuerySnapshot>(
      stream: _userRequests
          .where('uid', isEqualTo: _auth.currentUser?.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              textColor: Colors.white,
              title: Text(data['approvalStatus']),
              subtitle: Text(data['requestDescription']),
              trailing: Text(data['requestNumber']),
            );
          }).toList(),
        );
      },
    );
  }
}
