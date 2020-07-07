
import 'package:butce/yillar.dart';
import 'package:flutter/material.dart';




void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Harcamalarım",
      theme: ThemeData(
        fontFamily: "IlkFont",
        primarySwatch: Colors.orange,
      ),
      home: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -1.25),
            radius: 0.7 ,


            colors: [Color(0xffbd10e0),Color(0xfff5a623),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(elevation: 0,

            backgroundColor: Colors.transparent,
            title: Text("Aboneliklerim", style: TextStyle(fontFamily: "IlkFont",fontSize: 20, color: Colors.white ),),
            centerTitle: true,
          ),
          body: Yillar(),
        ),
      ),
    );
  }
}
