import 'package:flutter/material.dart';
import '../DetaySayfalari/BesinUrun_Ekrani.dart';

class BesinTakviiyeleriEkrani extends StatefulWidget {
  static const String pagename = '/BesinTakviyeleri';

  BesinTakviiyeleriEkrani({Key? key}) : super(key: key);

  @override
  State<BesinTakviiyeleriEkrani> createState() =>
      _BesinTakviiyeleriEkraniState();
}

class _BesinTakviiyeleriEkraniState extends State<BesinTakviiyeleriEkrani> {
  List<Map> products = [
    {
      "isim": "Hardline Whey3 2300Gr",
      "fotograf": "assets/images/hardlineWhey.jpeg",
      "fiyat": "1279₺"
    },
    {
      "isim": "Hardline Progainer 5000Gr",
      "fotograf": "assets/images/hardline_progainer.jpeg",
      "fiyat": "950₺"
    },
    {
      "isim": "Kingsize Nutrition BCAA ",
      "fotograf": "assets/images/kingsize.jpeg",
      "fiyat": "950₺"
    },
    {
      "isim": "Weider Amino Liquid",
      "fotograf": "assets/images/weider.jpeg",
      "fiyat": "599₺"
    },
    {
      "isim": "BCAA 2:1:1 300 Gr",
      "fotograf": "assets/images/bcaa.jpeg",
      "fiyat": "199₺"
    },
    {
      "isim": "Kingsize Nutrition GH ",
      "fotograf": "assets/images/kingsize.jpeg",
      "fiyat": "349₺"
    },
    {
      "isim": "WeiderWhey Protein Tozu 2300 Gr ",
      "fotograf": "assets/images/weider_premium.jpeg",
      "fiyat": "220₺"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: NewWidget(),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: Column(
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
      )),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Text('Besin Takviyeleri'),
        ],
      ),
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
                  BesinUrunEkrani(isim: text, foto: photoUrl, fiyat: fiyat)));
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
