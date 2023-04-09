import 'package:flutter/material.dart';

import '../DetaySayfalari/KiyafetUrun_Ekrani.dart';

class KiyafetEkrani extends StatefulWidget {
  static const String pagename = '/Kiyafetler';

  KiyafetEkrani({Key? key}) : super(key: key);

  @override
  State<KiyafetEkrani> createState() => _KiyafetEkraniState();
}

class _KiyafetEkraniState extends State<KiyafetEkrani> {
  List<Map> products = [
    {
      "isim": "MuscleCloth kolsuz tshirt ",
      "fotograf": "assets/images/musclecloth_elite.jpeg",
      "fiyat": "220₺"
    },
    {
      "isim": "Taytlı Stretch Şort Siyah",
      "fotograf": "assets/images/musclecloth.jpeg",
      "fiyat": "279₺"
    },
    {
      "isim": "MuscleCloth Kapüşonlu Kolsuz Yelek",
      "fotograf": "assets/images/kolsuzkapson_39540.jpeg",
      "fiyat": "389₺"
    },
    {
      "isim": "MuscleCloth T-Shirt Mavi ",
      "fotograf": "assets/images/tshirtmavi.jpeg",
      "fiyat": "399₺"
    },
    {
      "isim": "MuscleCloth Training Alpha Eşofman Altı Siyah",
      "fotograf": "assets/images/musclecloth-eşortman.jpeg",
      "fiyat": "379₺"
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
              const SizedBox(
                width: 5,
              ),
              const Text('Kıyafetler'),
            ],
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //İçerikler
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: products.map((Map product) {
                    return buildContent(product["isim"], product["fotograf"],
                        product["fiyat"], context);
                  }).toList(),
                ),
              ),
            ],
          ),
          //Bottom Navigation
        ],
      )),
    );
  }
}

Widget buildContent(String text, String photoUrl, String fiyat, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  KiyafetUrunEkrani(isim: text, foto: photoUrl, fiyat: fiyat)));
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black87.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 16))
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
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  " $fiyat",
                  style: const TextStyle(
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
