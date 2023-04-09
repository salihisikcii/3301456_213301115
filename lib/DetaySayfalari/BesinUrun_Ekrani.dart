import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BesinUrunEkrani extends StatefulWidget {
  static const String pagename = '/BesinUrunEkrani';
  @override
  late String isim;
  late String foto;
  late String fiyat;

  BesinUrunEkrani(
      {required this.isim, required this.foto, required this.fiyat});

  State<BesinUrunEkrani> createState() => _BesinUrunEkraniState();
}

class _BesinUrunEkraniState extends State<BesinUrunEkrani> {
  int adet = 0;
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
              const Text('Sipariş'),
            ],
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                widget.foto,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(widget.isim,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 21,
                        color: Colors.black87,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(widget.fiyat,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black87,
                      )),
                  RatingBarIndicator(
                    rating: 3.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 40.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          minimumSize: const Size(80, 40),
                          backgroundColor: Colors.black87,
                        ),
                        onPressed: () {
                          setState(() {
                            if (adet > 0) {
                              adet--;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20.0,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      adet.toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          minimumSize: const Size(80, 40),
                          backgroundColor: Colors.black87,
                        ),
                        onPressed: () {
                          setState(() {
                            adet++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.0,
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black87),
                    ),
                    onPressed: () {},
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Sepete Ekle',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ),
            ),
            Expanded(flex: 4, child: Container())
          ],
        ),
      )),
    );
  }
}
