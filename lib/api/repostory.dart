import 'package:flutter/cupertino.dart';
import 'package:users/api/resource.dart';

class Repostory {
  final api = Resource();

  Future getBarang() => api.getBarang();

  Future getBarangId(String idBarang) => api.getBarangId(idBarang);

  Future createPinjam(BuildContext context, String nama, String jumlahPinjam,
          String tanggalPinjam, String tanggalKembali) =>
      api.createPinjam(
          context, nama, jumlahPinjam, tanggalPinjam, tanggalKembali);
}
