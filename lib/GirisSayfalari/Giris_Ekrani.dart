import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vizeproje/Ana_Ekran.dart';
import 'package:vizeproje/GirisSayfalari/UyeOl_Ekrani.dart';

class GirisEkrani extends StatefulWidget {
  static const String pagename = '/';
  GirisEkrani({Key? key}) : super(key: key);

  @override
  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  late String isim;
  late String sifre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.black87,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 65,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (text) {
                  isim = text;
                },
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adınızı Giriniz",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                onChanged: (text) {
                  sifre = text;
                },
                decoration: InputDecoration(
                  hintText: "Şifrenizi Giriniz",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Üye Ol"),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, UyeOl.pagename);
                      });
                    },
                  ),
                  MaterialButton(
                    child: Text("Şifremi Unuttum"),
                    onPressed: () {},
                  ),
                ],
              ),
              _girisButton(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                ),
                child: Text("Üye Olmadan Devam Et"),
                onPressed: () {
                  setState(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AnaEkran.pagename, (route) => false);
                  });
                },
              )
            ],
          ),
        ));
  }

  Widget _girisButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black87,
        ),
        child: Text("Giriş Yap"),
        onPressed: () {
          setState(() {
            if (isim.isEmpty || sifre.isEmpty) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Başarısız"),
                      content: Text("Lütfen Gerekli Alanları Doldurunuz."),
                      actions: <Widget>[
                        MaterialButton(
                            child: Text("Geri Dön"),
                            onPressed: () => Navigator.pop(context))
                      ],
                    );
                  });
            } else {
              GirisVerisi Uyegirisbilgileri =
                  ModalRoute.of(context)!.settings.arguments as GirisVerisi;
              if (isim == Uyegirisbilgileri.uyeolisim &&
                  Uyegirisbilgileri.uyeolsifre == sifre) {
                Navigator.pushNamed(context, AnaEkran.pagename);
              } else {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Başarısız"),
                        content: Text("Kullanıcı Adınız Veya Şifreniz Hatalı."),
                        actions: <Widget>[
                          MaterialButton(
                              child: Text("Geri Dön"),
                              onPressed: () => Navigator.pop(context))
                        ],
                      );
                    });
              }
            }
          });
        },
      );
}
