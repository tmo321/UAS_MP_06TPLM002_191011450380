import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uas_tommy/cubit/kabar_berita_cubit.dart';

class KabarBeritaScreen extends StatefulWidget {
  const KabarBeritaScreen({Key? key}) : super(key: key);

  @override
  State<KabarBeritaScreen> createState() => _KabarBeritaScreenState();
}

class _KabarBeritaScreenState extends State<KabarBeritaScreen> {
  // Tambahkan cubit->KabarBeritaCubit di screen->KabarBeritaScreen
  final KabarBeritaCubit kabarBeritaCubit = KabarBeritaCubit();

  // Tambahkan initState
  @override
  void initState() {
    // Panggil getDataKabarBerita yang ada di KabarBeritaCubit
    kabarBeritaCubit.getDataKabarBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Center(child: Text('Tomy Himawan - 191011450380')),
            Text('KABAR BERITA'),
          ],
        ),
      ),
      body: BlocBuilder<KabarBeritaCubit, KabarBeritaState>(
        bloc: kabarBeritaCubit,
        builder: (context, state) {
          if (state is KabarBeritaInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            itemCount: kabarBeritaCubit.kabarBeritaModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              final parsedDate = DateTime.parse(
                  kabarBeritaCubit.kabarBeritaModel.data![index].pubDate!);
              final date = DateFormat('dd-MM-yyyy').format(parsedDate);
              return Card(
                child: ListTile(
                  leading: Image.network(kabarBeritaCubit
                      .kabarBeritaModel.data![index].thumbnail!),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  title: Text(
                    kabarBeritaCubit.kabarBeritaModel.data![index].title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        textAlign: TextAlign.left,
                        date,
                        style: const TextStyle(fontSize: 11),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'ini subtitle dari ' +
                            kabarBeritaCubit
                                .kabarBeritaModel.data![index].description!,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
