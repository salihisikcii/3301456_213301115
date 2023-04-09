import 'package:flutter/material.dart';
import 'package:vizeproje/DetaySayfalari/KiyafetUrun_Ekrani.dart';
import '../DetaySayfalari/BesinUrun_Ekrani.dart';

class TumUrunlerEkrani extends StatefulWidget {
  static const String pagename = '/TumUrunler';

  TumUrunlerEkrani({Key? key}) : super(key: key);

  @override
  State<TumUrunlerEkrani> createState() => _TumUrunlerEkraniState();
}

class _TumUrunlerEkraniState extends State<TumUrunlerEkrani> {
  List<Map> urunler = [
    {
      "isim": "Hardline Whey3 2300Gr",
      "fotograf": "assets/images/hardlineWhey.jpeg",
      "fiyat": "1279₺",
      "kategori": "besin",
    },
    {
      "isim": "Hardline Progainer 5000Gr",
      "fotograf": "assets/images/hardline_progainer.jpeg",
      "fiyat": "950₺",
      "kategori": "besin",
    },
    {
      "isim": "Kingsize Nutrition BCAA ",
      "fotograf": "assets/images/kingsize.jpeg",
      "fiyat": "950₺",
      "kategori": "besin",
    },
    {
      "isim": "Weider Amino Liquid",
      "fotograf": "assets/images/weider.jpeg",
      "fiyat": "599₺",
      "kategori": "besin",
    },
    {
      "isim": "MuscleCloth kolsuz tshirt ",
      "fotograf": "assets/images/musclecloth_elite.jpeg",
      "fiyat": "220₺",
      "kategori": "kıyafet"
    },
    {
      "isim": "Taytlı Stretch Şort Siyah",
      "fotograf": "assets/images/musclecloth.jpeg",
      "fiyat": "279₺",
      "kategori": "kıyafet"
    },
    {
      "isim": "BCAA 2:1:1 300 Gr",
      "fotograf": "assets/images/bcaa.jpeg",
      "fiyat": "199₺",
      "kategori": "besin",
    },
    {
      "isim": "Kingsize Nutrition GH ",
      "fotograf": "assets/images/kingsize.jpeg",
      "fiyat": "349₺",
      "kategori": "besin",
    },
    {
      "isim": "WeiderWhey Protein Tozu 2300 Gr ",
      "fotograf": "assets/images/weider_premium.jpeg",
      "fiyat": "1220₺",
      "kategori": "besin",
    },
    {
      "isim": "MuscleCloth Kapüşonlu Kolsuz Yelek",
      "fotograf": "assets/images/kolsuzkapson_39540.jpeg",
      "fiyat": "389₺",
      "kategori": "kıyafet"
    },
    {
      "isim": "MuscleCloth T-Shirt Mavi ",
      "fotograf": "assets/images/tshirtmavi.jpeg",
      "fiyat": "399₺",
      "kategori": "kıyafet"
    },
    {
      "isim": "MuscleCloth Training Alpha Eşofman Altı Siyah",
      "fotograf": "assets/images/musclecloth-eşortman.jpeg",
      "fiyat": "379₺",
      "kategori": "kıyafet"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 23,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Tüm Ürünler'),
            ],
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: urunler.map((Map product) {
                return buildContent(product["isim"], product["fotograf"],
                    product["fiyat"], product["kategori"], context);
              }).toList(),
            ),
          ),
        ],
      )),
    );
  }
}

Widget buildContent(
    String text, String photoUrl, String fiyat, String kategori, context) {
  return GestureDetector(
    onTap: () {
      if (kategori == 'kıyafet') {
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
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black87.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          Image.asset(photoUrl, width: 120),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  " $fiyat",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
