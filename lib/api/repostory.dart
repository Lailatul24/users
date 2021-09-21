import 'package:users/api/resource.dart';

class Repostory {
  final api = Resource();

  Future getBarang() => api.getBarang();

  Future getBarangId(String id) => api.getBarangId(id);
}
