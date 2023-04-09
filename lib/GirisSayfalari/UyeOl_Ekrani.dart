import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vizeproje/GirisSayfalari/Giris_Ekrani.dart';

class UyeOl extends StatefulWidget {
  static const String pagename = '/UyeOlEkrani';
  const UyeOl({Key? key}) : super(key: key);

  @override
  State<UyeOl> createState() => _UyeOlState();
}

class _UyeOlState extends State<UyeOl> {
  GirisVerisi girisVerisi = GirisVerisi('', '');
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
                Text('Üye Ol'),
              ],
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  onChanged: (text) {
                    girisVerisi.uyeolisim = text;
                  },
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı Giriniz",
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
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (text) {
                    girisVerisi.uyeolsifre = text;
                  },
                  decoration: InputDecoration(
                    hintText: "Şifre Giriniz",
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black87,
                      ),
                      child: Text("Kayıt Ol"),
                      onPressed: () {
                        if (girisVerisi.uyeolisim.isEmpty ||
                            girisVerisi.uyeolsifre.isEmpty) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Başarısız"),
                                  content: Text(
                                      "Lütfen Gerekli Alanları Doldurunuz."),
                                  actions: <Widget>[
                                    MaterialButton(
                                        child: Text("Geri Dön"),
                                        onPressed: () => Navigator.pop(context))
                                  ],
                                );
                              });
                        } else {
                          print('girdi');
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Başarılı"),
                                  content: Text("Giriş Yapabilirsiniiz."),
                                  actions: <Widget>[
                                    MaterialButton(
                                        child: Text("Giris Yap"),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, GirisEkrani.pagename,
                                              arguments: girisVerisi);
                                        })
                                  ],
                                );
                              });
                        }
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black87,
                      ),
                      child: Text("Giriş Yap"),
                      onPressed: () {
                        setState(() {
                          Navigator.popAndPushNamed(
                            context,
                            '/GirisEkrani',
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class GirisVerisi {
  late String uyeolisim;
  late String uyeolsifre;
  GirisVerisi(this.uyeolisim, this.uyeolsifre);
}
