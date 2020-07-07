
import 'package:butce/aylar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Yillar extends StatelessWidget {
  static var yil = DateTime.now().year;
  static var ay = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
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
            )),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Yıllar",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    ))
              ]),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(yillar, childCount: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3))
          ],
        ));
  }

  Widget yillar(BuildContext context, int index) {
    var secilen_yil = index + 2020;
    return GestureDetector(
      onTap: () {
        print(ay);
        if ((index + 2020) <= yil) {
          print("${index + 2020} tıklandı");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Aylar(secilen_yil)));
        }
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 0),
                  spreadRadius: 2,
                  blurRadius: 2,
                )
              ]),
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 30,
          width: 200,
          child: Text(
            "${index + 2020}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ((index + 2020) == yil) ? Colors.black : Colors.grey),
          )),
    );
  }
}
