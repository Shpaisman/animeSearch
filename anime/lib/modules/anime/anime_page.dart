import 'package:anime/modules/anime/anime_controller.dart';
import 'package:anime/modules/anime/anime_model.dart';
import 'package:flutter/material.dart';
import 'anime_model.dart';

class AnimePage extends StatefulWidget {
  @override
  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  Future<Results> _resultado;
  AnimeController animeController = new AnimeController();
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            "Anime search",
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.deepPurple])), //Highway Star
          child: Column(
            children: [
              TextFormField(
                onFieldSubmitted: (nome) {
                  setState(() {
                    _resultado = animeController.fetchAnime(nome);
                  });
                },
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25.0),
                decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ), // icon is 48px widget.
                    ),
                    hintText: 'Digite o nome de um anime',
                    hintStyle: TextStyle(fontSize: 20.0)),
              ),
              _resultado == null
                  ? Text("")
                  : FutureBuilder<Results>(
                      future: _resultado,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              snapshot.data.rated == "R+" ||
                                      snapshot.data.rated == "Rx"
                                  ? Text(
                                      "ESSE ANIME É BOM",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    )
                                  : Text(
                                      "ESSE ANIME É RUIM",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                              Image.network(snapshot.data.imageUrl),
                              Text(snapshot.data.title),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 100, 10),
                                width: 200,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    color: Colors.amberAccent,
                                    elevation: 10,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                          title: Text(
                                            "Score: ",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: snapshot.data.score > 7.6
                                              ? Colors.green
                                              : Colors.red,
                                          child: Text(
                                            snapshot.data.score
                                                .toString()
                                                .replaceAll('.', ','),
                                            style: TextStyle(fontSize: 35),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("Erro: ${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    )
            ],
          ),
        ));
  }
}
