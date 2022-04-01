import 'dart:math'; // random sayı için gerekli fonksiyon

import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          // appbar kısmı
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'Günün Menüsü',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body:
            YemekSayfasi(), // burada yeni fonk tanımladık karmaşık olmasın diye
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  void yemekleriYenile() {
    // random sayı olusturmak ıcın fonk olusturduk
    setState(
      // bunun nedeni programDa stateful da setstate yapmak
      // zorunlulugundan kaynaklı yoksa sayfa yenilenmez.
      () {
        corbaNo = Random().nextInt(5) + 1;
        yemekNo = Random().nextInt(5) + 1;
        tatliNo = Random().nextInt(5) + 1;
      },
    );
  }

  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> corbaAdlari = [
    // corba adları diye list verdik yazdırmak için
    'Mercimek Çorbası',
    'Tarhana Çorbası',
    'Tavuksuyu Çorbası',
    'Düğün Çorbası',
    'Yoğurtlu Çorba'
  ];

  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Izgara Balık'
  ];

  List<String> tatliAdlari = [
    'Kadayıf',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            //  3 resim koyduk ama ekrana sığmadı. Bu yüzden expanded
            //  Widgetini kullandık böylelikle ekrana 3ü tam sığdı.
            //  Expanded(flex:1 veya 2 ile farklı boyulamalarda yapılabilir.
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                // Bunun sayesinde tıklamak için resmin arkadasında yer açıldı
                highlightColor: Colors.white,
                splashColor:
                    Colors.white, // bastıkdan ve bekletirken çıkan şekil
                onPressed:
                    yemekleriYenile, // burda resme basılınca fonksiyona gönderdik. yazdık onu
                child: Image.asset(
                    'assets/corba_${corbaNo}.jpg'), // corba nosuna göre resim gelicek
              ),
            ),
          ),
          Text(
            corbaAdlari[
                corbaNo - 1], // corbaların adlarını yazdırmak için yaptık
            style: TextStyle(fontSize: 20),
          ),
          Container(
              // container almamızın neden divider çok uzun oluyordu sınırladık.
              width: 250,
              child: Divider(
                // yazının altında çizgi cıkması için
                height: 5,
              )),
          Expanded(
            // Yemeklerin oldugu kısım üsttekiyle neredeyse aynı
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/yemek_${yemekNo}.jpg')),
            ),
          ),
          Text(
            yemekAdlari[yemekNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 250,
              child: Divider(
                height: 5,
              )),
          Expanded(
            // tatıların oldugu kısım üsttekiyle neredeyse aynı
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: yemekleriYenile,
                  child: Image.asset('assets/tatli_${tatliNo}.jpg')),
            ),
          ),
          Text(
            tatliAdlari[tatliNo - 1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
              width: 250,
              child: Divider(
                height: 5,
              )),
        ],
      ),
    );
  }
}
