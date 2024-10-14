import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cordes/core/viewmodels/request_view_model.dart';
import 'package:cordes/ui/views/base_view.dart';
import 'package:cordes/ui/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RequestView extends StatelessWidget {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  const RequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CollectionReference userRequests =
        FirebaseFirestore.instance.collection('userRequests');
    return BaseView<RequestViewModel>(
        builder: (context, model, child) => StreamBuilder<QuerySnapshot>(
            stream: userRequests
                .where('uid', isEqualTo: firebaseAuth.currentUser?.uid)
                .where('isDeleted', isEqualTo: false)
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading');
              }

              return RefreshIndicator(
                onRefresh: () {
                  return Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomeView()));
                },
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    final Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return ListTile(
                      onTap: () async {
                        var reqNum = data['requestNumber'];
                        await showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                  title: const Text(
                                      'Talebinizi silmek mi istiyorsunuz?'),
                                  children: [
                                    SimpleDialogOption(
                                      child: Row(
                                        children: [
                                          Icon(Icons.cancel),
                                          Text('Hayır')
                                        ],
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SimpleDialogOption(
                                      child: Row(
                                        children: [
                                          Icon(Icons.check),
                                          Text("Evet")
                                        ],
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await model.deleteRequest(reqNum);
                                      },
                                    )
                                  ],
                                ));
                      },
                      title: Text(
                        data['requestType'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        data['requestDescription'],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              );
            }));
  }
}
