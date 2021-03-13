import 'package:flutter/material.dart';


main() {
  runApp(MaterialApp(
    title: "Votação do Reino de Tão Tão Distante!",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Votação em andamento";
  int s = 0;
  int c = 0;

  void _changeVote(int vote, int candidato){
    setState(() {
      if (candidato == 1) {
          s += 1;
          if(s == 10){
            _infoText = "Shrek ganhou!";
          }
      }else if (candidato == 2) {
          c += 1;
          if (c == 10) {
          _infoText = "Prince ganhou!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("images/vote.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0), 
                  child: TextButton(
                    child: Image.asset("images/shrek.jpg",
                          fit: BoxFit.scaleDown, width: 170.0,),
                    onPressed: () {
                      _changeVote(c, 1);
                    },
                  )
                ),
                  
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextButton(
                    child: Image.asset("images/prince.jpg",
                          fit: BoxFit.scaleDown, width: 150.0),
                    onPressed: () {
                      _changeVote(s, 2);
                    },
                  )
                ),
              ],
            ),          
          Text(
              "Shrek = $s",
              style: TextStyle(color: Colors.blue, fontSize: 40.0),
            ),
          Text(
              "Prince = $c",
              style: TextStyle(color: Colors.blue, fontSize: 40.0),
            ),
          Text(
              "$_infoText",
              style: TextStyle(color: Colors.blue, fontSize: 40.0),
            ),
          ],
        )
      ],
    );
  }
}