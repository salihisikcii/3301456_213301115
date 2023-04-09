import 'package:flutter/material.dart';
import 'package:vizeproje/KatagoriSayfalari/BesinTakviyleri_Ekran.dart';
import 'package:vizeproje/KatagoriSayfalari/Kyafetler_Ekran.dart';
import 'package:vizeproje/KatagoriSayfalari/TumUrunler.dart';
import 'package:vizeproje/profil.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[50],
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            accountName: const Text('Salih Işıkcı'),
            accountEmail: const Text('salih.isikci1@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Profil.pagename);
                  },
                  splashColor: Colors.cyan,
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profil'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, TumUrunlerEkrani.pagename);
                  },
                  splashColor: Colors.cyan,
                  child: const ListTile(
                    leading: Icon(Icons.article),
                    title: Text('Tüm Ürünler'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, KiyafetEkrani.pagename);
                  },
                  splashColor: Colors.cyan,
                  child: const ListTile(
                    leading: Icon(Icons.article_outlined),
                    title: Text('Kıyafetler'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, BesinTakviiyeleriEkrani.pagename);
                  },
                  splashColor: Colors.cyan,
                  child: const ListTile(
                    leading: Icon(Icons.article_outlined),
                    title: Text('Besin Takviyeleri'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
