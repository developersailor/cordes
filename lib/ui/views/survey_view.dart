import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SurveyView extends StatefulWidget {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference surveyDataCollection =
      FirebaseFirestore.instance.collection('surveyData');
  static String _surveyLink = "https://forms.gle/dYbFTgTD8LT6nEBp8";

  @override
  State<SurveyView> createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> {
  bool change = true;

  void _launchURL() async {
    if (!await launch(SurveyView._surveyLink))
      throw 'Could not launch ${SurveyView._surveyLink}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color.fromRGBO(98, 0, 238, 1)),
        onPressed: () async {
          _launchURL();
        },
        child: Text('Ankete Katıl'),
      ),
    ));
  }
}
