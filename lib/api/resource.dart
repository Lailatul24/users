import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:users/model/barangModel.dart';

class Resource {
  var uri = "https://maisyaroh.com/sarpras/api";

  Future getBarang() async {
    var url = Uri.parse(uri + '/barang');

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return BarangModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return BarangModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getBarangId(String id) async {
    var url = Uri.parse(uri + '/barang' + id);

    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      print(res.body);
      if (res.statusCode == 200) {
        return BarangModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return BarangModel.fromJson(res.body);
      } else {
        throw Exception('Failur Response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("Tidak Menemukan Post");
      }
    } on FormatException {
      throw Exception('Request Salah');
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }
}
