import 'package:dynamic_not/helper/helper_data.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  const DersListesi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: DataHelper.tumEklenecekDersler.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              subtitle: Text(
                  DataHelper.tumEklenecekDersler[index].harfDegeri.toString()),
              title: Text(DataHelper.tumEklenecekDersler[index].ad),
            ),
          );
        });
  }
}
