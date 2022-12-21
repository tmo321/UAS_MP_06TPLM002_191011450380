import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:uas_tommy/request/kabar_berita_request.dart';

import '../model/kabar_berita_model.dart';

part 'kabar_berita_state.dart';

class KabarBeritaCubit extends Cubit<KabarBeritaState> {
  KabarBeritaCubit() : super(KabarBeritaInitial());

  // Tambahakan Cubit KabarBeritaRequest
  final KabarBeritaRequest kabarBeritaRequest = KabarBeritaRequest();

  // Tambahakan Model KabarBeritaModel
  KabarBeritaModel kabarBeritaModel = KabarBeritaModel();

  // Tambahakan Function getDataKabarBerita yang akan digunanan nanti di Screen
  getDataKabarBerita() async {
    emit(KabarBeritaInitial());
    kabarBeritaModel = await kabarBeritaRequest.getKabarBerita();
    emit(DataKabarBerita(kabarBeritaModel));
  }
}
