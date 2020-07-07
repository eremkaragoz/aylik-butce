
import 'package:butce/abone_ol.dart';
import 'package:butce/stringler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Abonelikler extends StatefulWidget {
  int servis_sayisi = 0;

  int gelen_yil;
  int gelen_ay;

  Abonelikler(this.gelen_ay, this.gelen_yil);

  @override
  _AboneliklerState createState() => _AboneliklerState();
}

class _AboneliklerState extends State<Abonelikler> {
  static int sayac = 0;
  List<Servisler> tumServisler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumServisler = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -1.25),
          radius: 0.7,
          colors: [
            Color(0xffbd10e0),
            Color(0xfff5a623),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
          title: Text(
            "Aboneliklerim",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
        ),
        floatingActionButton: SpeedDial(
          child: Icon(Icons.filter_list),
          children: [
            SpeedDialChild(
                child: Icon(Icons.add),
                label: "Ekle",
                backgroundColor: Colors.deepOrange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AboneOl(widget.gelen_ay, widget.gelen_yil),
                    ),
                  ).then((value) {
                    print(value[0]);
                    print(value[1]);
                    print(value[2]);
                    setState(() {
                      tumServisler.add(
                          Servisler(value[0], value[1], value[2]),
                      );
                      parayiHesapla();


                    });
                  });
                }),

          ],
        ),
        body: AboneGovdesi(widget.gelen_ay, widget.gelen_yil,
            widget.servis_sayisi),
      ),
    );
  }

  Widget AboneGovdesi(gelen_ay, gelen_yil, servis_sayisi) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "$gelen_yil ${Stringler.AYLAR[gelen_ay - 1]} ayında aboneliklerin için",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.all(10),
                  ),
                  Text(
                    "${parayiHesapla()} TL",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Text(
                      "ödedin.",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.all(10),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
                child: tumServisler.length == 0
                    ? Center(
                  child: Text(
                    "Hiçbir aboneliğiniz yok.",
                    textAlign: TextAlign.center,
                  ),
                )
                    : ListView.builder(
                  itemBuilder: listeElemanlariOlustur,
                  itemCount: tumServisler.length,
                ))
          ]),
    );
  }

  Widget listeElemanlariOlustur(BuildContext context, int index) {
    sayac++;
    return Dismissible(
      key: Key(sayac.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          tumServisler.removeAt(index);
          parayiHesapla();
        });
      },
      child: Card(
        child: ListTile(
          title: Text(tumServisler[index].isim),
          trailing: Text("${tumServisler[index].guncel_fiyat} ₺"),
          leading: Image.asset(Stringler.UYG_RESIMLERI[int.parse(tumServisler[index].id)-1], width: 20,),

        ),
      ),
    );
  }

  double parayiHesapla() {
    double toplam_para = 0;

    for (var anlikItem in tumServisler) {
      var ucret = anlikItem.guncel_fiyat;
      toplam_para += ucret;
    }

    return toplam_para;
  }
}
