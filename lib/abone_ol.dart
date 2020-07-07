import 'package:butce/stringler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AboneOl extends StatefulWidget {
  int gelen_yil;
  int gelen_ay;

  AboneOl(this.gelen_ay, this.gelen_yil);

  @override
  _AboneOlState createState() => _AboneOlState();
}

class _AboneOlState extends State<AboneOl> {
  List<Map> _myJson = [
    {"id": '1', "image": "images/netflix.png", "name": "Netflix"},
    {"id": '2', "image": "images/spotify.png", "name": "Spotify"},
    {"id": '3', "image": "images/youtube.png", "name": "Youtube Premium"},
    {"id": '4', "image": "images/applemusic.png", "name": "Apple Music"},
    {"id": '5', "image": "images/digiturk.png", "name": "Digiturk"},
    {"id": '6', "image": "images/dsmart.png", "name": "D-Smart"},
    {"id": '7', "image": "images/grammarly.png", "name": "Grammarly"},
    {"id": '8', "image": "images/turksat.png", "name": "Türksat"},
    {"id": '9', "image": "images/turktelekom.png", "name": "Türk Telekom"},
    {"id": '10', "image": "images/turkcell.png", "name": "SuperOnline"},
    {"id": '11', "image": "images/ttnet.png", "name": "TTNET"},
    {"id": '12', "image": "images/bedas.png", "name": "BEDAŞ"},
    {"id": '13', "image": "images/iski.jpg", "name": "İSKİ"},
    {"id": '14', "image": "images/igdas.png", "name": "İGDAŞ"},
    {"id": '15', "image": "images/puhutv.jpg", "name": "Puhu TV"},
    {"id": '16', "image": "images/zomato.png", "name": "Zomato"},
    {"id": '17', "image": "images/isbank.png", "name": "İş Bankası"},
    {"id": '18', "image": "images/yapikredi.png", "name": "Yapı Kredi"},
    {"id": '19', "image": "images/akbank.jpg", "name": "Akbank"},
    {"id": '20', "image": "images/appletv.png", "name": "Apple TV"},
  ];

  String _secilen;
  double guncel_ucret;

  String servisAdi = "Netflix";
  List<Servisler> tumServisler;
  var formKey = GlobalKey<FormState>();

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
        resizeToAvoidBottomPadding: false,
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
            "Abone Ekle",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: AboneOlmaGovdesi(widget.gelen_ay, widget.gelen_yil),
      ),
    );
  }

  Widget AboneOlmaGovdesi(gelen_ay, gelen_yil) {
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
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: DropdownButton<String>(
                            isDense: true,
                            hint: Text("Servis seçin"),
                            value: _secilen,
                            onChanged: (String secilenServis) {
                              setState(() {
                                _secilen = secilenServis;
                              });
                              print("$_secilen");
                            },
                            items: _myJson.map((Map map) {
                              return DropdownMenuItem<String>(
                                value: map["id"].toString(),
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.asset(
                                          map["image"],
                                          width: 18,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        map["name"],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Aylık ücreti",
                          hintText: "10",
                          border: OutlineInputBorder(),
                        ),
                        validator: (girilenDeger) {
                          if (girilenDeger.length > 0) {
                            double deger = double.parse(girilenDeger);
                            if (deger >= 0) {
                              return null;
                            } else
                              return "Eksik veya yanlış bir değer girdiniz.";
                          } else
                            return "Eksik veya yanlış bir değer girdiniz.";
                        },
                        onSaved: (guncelKaydedilecekUcret) {
                          guncel_ucret = double.parse(guncelKaydedilecekUcret);
                          setState(() {
                            tumServisler.add(Servisler(
                                _secilen,
                                _myJson[int.parse(_secilen)]["name"],
                                guncel_ucret));
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.orangeAccent,
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              Navigator.pop(context, [
                                _secilen,
                                _myJson[int.parse(_secilen) - 1]["name"],
                                guncel_ucret
                              ]);
                            }
                          },
                          child: Text(
                            "Ekle",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "İptal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          )),
        ],
      ),
    );
  }
}

class Servisler {
  String id;
  String isim;
  double guncel_fiyat;
  String img;

  Servisler(this.id, this.isim, this.guncel_fiyat, {this.img});
}
