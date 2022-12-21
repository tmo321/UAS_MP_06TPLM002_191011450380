part of 'kabar_berita_cubit.dart';

@immutable
abstract class KabarBeritaState {}

class KabarBeritaInitial extends KabarBeritaState {}

// Tambahkan State untuk Data Kabar Berita
class DataKabarBerita extends KabarBeritaState {
  final KabarBeritaModel data;
  DataKabarBerita(this.data);
}
