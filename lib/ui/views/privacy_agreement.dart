import 'package:flutter/material.dart';

class PrivacyAgreement extends StatefulWidget {
  const PrivacyAgreement({Key? key}) : super(key: key);

  @override
  _PrivacyAgreementState createState() => _PrivacyAgreementState();
}

class _PrivacyAgreementState extends State<PrivacyAgreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gizlilik Sözleşmesi'),
      ),
      body: Container(
        color: Colors.deepOrangeAccent.shade100,
        child: Container(
          alignment: Alignment.center,
          color: Colors.deepOrangeAccent.shade100,
          child: const Text(
            '''
            Üyelik sözleşmesi ve gizlilik sözleşmesi (bu sözleşmeyi daha önce okuduysanız, okuduğunuz sözleşmeyi okuyarak, anladığınızı ve bu sözleşmeyi kabul ettiğinizi kabul ederiz).
          ''',
            maxLines: 120,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
