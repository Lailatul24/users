import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:users/api/repostory.dart';
import 'package:users/model/barangIdModel.dart';
import 'package:users/model/barangModel.dart';

class HomeController {
  final repostory = Repostory();

  final _barangFetchar = PublishSubject<BarangModel>();
  final _barangIdFetchar = PublishSubject<BarangIdModel>();

  PublishSubject<BarangModel> get resBarang => _barangFetchar;
  PublishSubject<BarangIdModel> get resIdBarang => _barangIdFetchar;

  void getBarang() async {
    try {
      BarangModel barangModel = await repostory.getBarang();
      _barangFetchar.sink.add(barangModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void getIdBarang(String idBarang) async {
    try {
      BarangIdModel barangIdModel = await repostory.getBarangId(idBarang);
      _barangIdFetchar.sink.add(barangIdModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void addPinjam(BuildContext context, String nama, String jumlahPinjam,
      String tanggalPinjam, String tanggalKembali) async {
    try {
      await repostory.createPinjam(
          context, nama, jumlahPinjam, tanggalPinjam, tanggalKembali);
    } catch (e) {
      print(e.toString());
    }
  }

  void dipose() {
    _barangFetchar.close();
    _barangIdFetchar.close();
  }
}
