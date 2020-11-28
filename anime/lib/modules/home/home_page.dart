import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            height: double.infinity,
            child: Image.asset('assets/images/okaeri.jpg', fit: BoxFit.fill),
          ),
        ),
        Text(
          "Okaeri Senpai",
          style: TextStyle(fontSize: 60, height: 4),
        ),
        Positioned(
          bottom: 40,
          left: 5,
          child: RaisedButton(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.black)),
              child:
                  Text("Vamos ver se seu gosto em animes é bom? Clique aqui."),
              onPressed: () {
                Navigator.pushNamed(context, '/anime');
              }),
        )
      ]),
    );
  }
}
