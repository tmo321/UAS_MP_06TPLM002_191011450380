import 'package:dio/dio.dart';

import '../model/kabar_berita_model.dart';

class KabarBeritaRequest {
  // Tambahkan Function untuk request untuk Data Kabar Berita
  Future<KabarBeritaModel> getKabarBerita() async {
    Response response = await Dio()
        .get('https://api-berita-indonesia.vercel.app/antara/terbaru');
    return KabarBeritaModel.fromJson(response.data);
  }
}
