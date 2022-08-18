import 'package:dynamic_not/consts/constants.dart';
import 'package:dynamic_not/helper/helper_data.dart';
import 'package:dynamic_not/model/ders.dart';
import 'package:dynamic_not/pages/ders_listesi.dart';
import 'package:dynamic_not/pages/ortalama_goster.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  double yeniDeger = 4;
  int yeniKredi = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            Sabitler.baslikName,
            style: Sabitler.baslikStyle,
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: _buildForm(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: OrtalamaGoster(
                          dersSayisi: DataHelper.tumEklenecekDersler.length,
                          ortalama: DataHelper.ortalamaHesapla()),
                    ),
                  ),
                ],
              ),

              //--------------------column 2. Elemanı -----------------

              const DersListesi(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _buildTextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHarfler(),
                  _buildKredi(),
                  IconButton(
                    color: Sabitler.mainColor,
                    onPressed: (){
                      setState(() {
                        dersEkleveOrtalamaHesapla();
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  _buildTextFormField() {
    return TextFormField(
   
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        setState(() {});
        if (s!.isEmpty) {
          return 'Ders Adını Giriniz';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Sabitler.mainColor.shade100.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
        ),
        hintText: 'Ders',
      ),
    );
  }

  _buildHarfler() {
    return Container(
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.mainColor.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 5,
        iconEnabledColor: Sabitler.mainColor,
        iconSize: 29,
        value: yeniDeger,
        onChanged: (deger) {
          setState(() {
            yeniDeger = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }

  _buildKredi() {
    return Container(
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.mainColor.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<int>(
        elevation: 16,
        iconEnabledColor: Sabitler.mainColor,
        iconSize: 30,
        value: yeniKredi,
        onChanged: (deger) {
          setState(() {
            yeniKredi = deger!;
          });
        },
        underline: Container(),
        items: DataHelper.tumKrediler(),
      ),
    );
  }

  dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: yeniDeger,
          krediDegeri: yeniKredi.toDouble());
      DataHelper.dersEkle(eklenecekDers);
    }
  }
}
