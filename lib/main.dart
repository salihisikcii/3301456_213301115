import 'package:flutter/material.dart';
import 'package:vizeproje/Ana_Ekran.dart';
import 'package:vizeproje/KatagoriSayfalari/BesinTakviyleri_Ekran.dart';
import 'package:vizeproje/DetaySayfalari/BesinUrun_Ekrani.dart';
import 'package:vizeproje/DetaySayfalari/KiyafetUrun_Ekrani.dart';
import 'package:vizeproje/KatagoriSayfalari/Kyafetler_Ekran.dart';
import 'package:vizeproje/KatagoriSayfalari/TumUrunler.dart';
import 'package:vizeproje/GirisSayfalari/UyeOl_Ekrani.dart';
import 'package:vizeproje/profil.dart';
import 'GirisSayfalari/Giris_Ekrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'metarilalpage',
      initialRoute: GirisEkrani.pagename,
      routes: {
        GirisEkrani.pagename: (context) => GirisEkrani(),
        UyeOl.pagename: (context) => UyeOl(),
        AnaEkran.pagename: (context) => AnaEkran(),
        TumUrunlerEkrani.pagename: (context) => TumUrunlerEkrani(),
        KiyafetEkrani.pagename: (context) => KiyafetEkrani(),
        Profil.pagename: (context) => Profil(),
        BesinTakviiyeleriEkrani.pagename: (context) =>
            BesinTakviiyeleriEkrani(),
        BesinUrunEkrani.pagename: (context) =>
            BesinUrunEkrani(fiyat: '', foto: '', isim: ''),
        KiyafetUrunEkrani.pagename: (context) =>
            KiyafetUrunEkrani(fiyat: '', foto: '', isim: ''),
      },
    );
  }
}
