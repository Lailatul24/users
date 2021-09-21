import 'package:flutter/material.dart';
import 'package:users/controller/homeController.dart';
import 'package:users/dashboard.dart';

class PinjamForm extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String idBarang;
  const PinjamForm({Key key, this.idBarang}) : super(key: key);

  @override
  _PinjamFormState createState() => _PinjamFormState();
}

class _PinjamFormState extends State<PinjamForm> {
  final con = HomeController();

  String nama = '';
  String stok = '';
  String jumlahPinjam = '';
  String tanggalPinjam = '';
  String tanggalKembali = '';

  @override
  void initState() {
    super.initState();
    getIdBarang();
  }

  getIdBarang() async {
    con.getIdBarang(widget.idBarang.toString());
    con.resIdBarang.listen((value) {
      nama = value.data.nama;
      stok = value.data.stok;

      print(nama);
      setState(() {});
    });
  }

  final namaController = TextEditingController();
  final jumlahPinjamController = TextEditingController();
  final tanggalPinjamController = TextEditingController();
  final tanggalKembaliController = TextEditingController();

  addPinjam() async {
    String nama = namaController.text;
    String jumlahPinjam = jumlahPinjamController.text;
    String tanggalPinjam = tanggalPinjamController.text;
    String tanggalKembali = tanggalKembaliController.text;

    if (nama == '' ||
        jumlahPinjam == '' ||
        tanggalPinjam == '' ||
        tanggalKembali == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Harus Diisi !!')));
    } else {
      con.addPinjam(context, nama, jumlahPinjam, tanggalPinjam, tanggalKembali);
      namaController.text = '';
      jumlahPinjamController.text = '';
      tanggalPinjamController.text = '';
      tanggalKembaliController.text = '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Peminjaman'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(nama),
                  subtitle: Text(stok),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ),
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
            Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "jumlah Terpinjam",
                      labelText: "jumlah Barang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF838C8A)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  onPressed: () => addPinjam(),
                  child: Text('simpan'),
                ))
          ],
        ),
      ),
    );
  }
}
