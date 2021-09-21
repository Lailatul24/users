import 'package:flutter/material.dart';

class PinjamForm extends StatefulWidget {
  const PinjamForm({Key key}) : super(key: key);

  @override
  _PinjamFormState createState() => _PinjamFormState();
}

class _PinjamFormState extends State<PinjamForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Peminjaman'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InputDatePickerFormField(
                  fieldLabelText: 'Tanggal Pinjam',
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2021),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InputDatePickerFormField(
                  fieldLabelText: 'Tanggal Kembali',
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2021),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
