import 'package:flutter/material.dart';
import 'package:vizeproje/DetaySayfalari/BesinUrun_Ekrani.dart';
import 'package:vizeproje/DetaySayfalari/KiyafetUrun_Ekrani.dart';
import 'Drawer_menu.dart';

class AnaEkran extends StatefulWidget {
  static const String pagename = '/AnaSayfa';

  AnaEkran({Key? key}) : super(key: key);
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: CircleAvatar(
            radius: 23,
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return const NewWidget();
          },
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BesinUrunEkrani(
                        isim: 'BCAA 2:1:1 300 Gr',
                        foto: "assets/images/bcaa.jpeg",
                        fiyat: "199₺")));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Image.asset('assets/images/anaekranindirim.jpeg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: double.infinity,
            height: 50,
            child: Center(
                child: Text(
              'Çok Satılanlar',
              style: TextStyle(color: Colors.grey[50], fontSize: 22),
            )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildUrun(
                  text: "Hardline Progainer 5000Gr",
                  photoUrl: "assets/images/hardline_progainer.jpeg",
                  fiyat: "950₺",
                  kategori: 'besin',
                  context: context),
            ),
            Expanded(
              child: buildUrun(
                  text: "Hardline Whey3 2300Gr  ",
                  photoUrl: "assets/images/hardlineWhey.jpeg",
                  fiyat: "1279₺",
                  kategori: 'besin',
                  context: context),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildUrun(
                  text: "Weider Amino Liquid",
                  photoUrl: "assets/images/weider.jpeg",
                  fiyat: "599₺",
                  kategori: 'besin',
                  context: context),
            ),
            Expanded(
              child: buildUrun(
                  text: "Kingsize Nutrition BCAA",
                  photoUrl: "assets/images/kingsize.jpeg",
                  fiyat: "950₺",
                  kategori: 'besin',
                  context: context),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildUrun(
                  text: "MuscleCloth kolsuz tshirt",
                  photoUrl: "assets/images/musclecloth_elite.jpeg",
                  fiyat: "220₺",
                  kategori: 'kıyafet',
                  context: context),
            ),
            Expanded(
              child: buildUrun(
                  text: "Taytlı Stretch Şort Siyah",
                  photoUrl: "assets/images/musclecloth.jpeg",
                  fiyat: "279₺",
                  kategori: 'kıyafet',
                  context: context),
            ),
          ],
        ),
      ],
    );
  }
}

Widget buildUrun(
    {required String text,
    required String photoUrl,
    required String fiyat,
    required String kategori,
    context}) {
  AnaEkranVeriler veriler = AnaEkranVeriler(text, photoUrl, fiyat, kategori);

  return GestureDetector(
    onTap: () {
      if (veriler.katagori == 'kıyafet') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KiyafetUrunEkrani(
                    isim: text, foto: photoUrl, fiyat: fiyat)));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BesinUrunEkrani(isim: text, foto: photoUrl, fiyat: fiyat)));
      }
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Image.asset(photoUrl, height: 150),
          const SizedBox(height: 5),
          Center(
              child: Text(text,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ))),
          Text(
            fiyat,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

class AnaEkranVeriler {
  late String urunisim;
  late String urunresim;
  late String urunfiyat;
  late String katagori;
  AnaEkranVeriler(this.urunisim, this.urunresim, this.urunfiyat, this.katagori);
}
