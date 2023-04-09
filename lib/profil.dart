import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  static const String pagename = '/profil';

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text('Profil'),
              ],
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  Center(
                      child: SizedBox(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                  )),
                  SizedBox(height: 20),
                  buildProfile("Hesabım", Icons.person),
                  buildProfile("Adres bilgilerim", Icons.doorbell_outlined),
                  buildProfile("Ayarlar", Icons.settings_rounded),
                  buildProfile("Çıkış", Icons.login_outlined),
                ]))));
  }
}

Widget buildProfile(String title, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
          padding: EdgeInsets.all(20)),
      onPressed: () {},
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: 20),
          Expanded(
            child: Text(title),
          ),
          Icon(Icons.arrow_back_ios_outlined),
        ],
      ),
    ),
  );
}
