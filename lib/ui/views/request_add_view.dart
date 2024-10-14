import 'package:cordes/core/viewmodels/request_add_view_model.dart';
import 'package:cordes/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class RequestAddView extends StatelessWidget {
  static final TextEditingController _controller = TextEditingController();

  const RequestAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var dropdownValue;
    return BaseView<RequestAddViewModel>(
      builder:
          (BuildContext context, RequestAddViewModel model, Widget? child) =>
              Scaffold(
        backgroundColor: Colors.deepOrangeAccent.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[600],
          title: const Text('İstek ve Destek Ekleme Ekranı'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.popAndPushNamed(context, '/'),
          ),
        ),
        body: Form(
            child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Destek Türünü Seçiniz.',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              widthFactor: double.infinity,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                items: <String>[
                  'Eğitim yardımı',
                  'Para yardımı',
                  'Eşya yardımı',
                  'Sosyal yardım',
                  'Destek olmak istiyorum'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  dropdownValue = newValue;
                  model.dropDownDone(newValue);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'İstek veya yapacağınız destek hakkında bilgi veriniz.',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(98, 0, 238, 1),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(98, 0, 238, 1))),
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(98, 0, 238, 1)))),
              style: TextStyle(color: Colors.white),
              controller: _controller,
              onSaved: (String? value) {
                model.userRequest.requestDescription = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(98, 0, 238, 1),
              ),
              onPressed: () {
                model.createRequest(dropdownValue, _controller.text);
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Gönder'),
            )
          ],
        )),
      ),
    );
  }
}
