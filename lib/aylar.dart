

import 'package:butce/abonelikler.dart';
import 'package:butce/stringler.dart';
import 'package:flutter/material.dart';


class Aylar extends StatelessWidget {
  static var yil = DateTime.now().year;
  static var ay = DateTime.now().month;

  var gelen_yil;


  Aylar(this.gelen_yil);

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
        body: Container(
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
              )),
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Aylar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),

                Divider(
                  color: Colors.grey,
                ),
                Expanded(
                    child: ListView.builder(
                      itemBuilder: aylar,
                      itemCount: Stringler.AYLAR.length,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget aylar(BuildContext context, int index) {
    var secilen_ay = index + 1;
    return GestureDetector(
      onTap: () {
        if (ay >= secilen_ay) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Abonelikler(
                secilen_ay,
                gelen_yil,

              ),
            ),
          );
          print(secilen_ay);
          print(gelen_yil);
        }
      },
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            Stringler.AYLAR[index],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ay >= (index + 1) ? Colors.black : Colors.grey),
          ),
          leading: Icon(Icons.clear_all),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
