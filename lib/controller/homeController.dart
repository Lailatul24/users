import 'package:rxdart/rxdart.dart';
import 'package:users/api/repostory.dart';
import 'package:users/model/barangModel.dart';

class HomeController {
  final repostory = Repostory();

  final _barangFetchar = PublishSubject<BarangModel>();
  final _barangIdFetchar = PublishSubject<BarangModel>();

  PublishSubject<BarangModel> get resBarang => _barangFetchar;
  PublishSubject<BarangModel> get resIdBarang => _barangIdFetchar;

  void getBarang() async {
    try {
      BarangModel barangModel = await repostory.getBarang();
      _barangFetchar.sink.add(barangModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void dipose() {
    _barangFetchar.close();
    _barangIdFetchar.close();
  }
}
