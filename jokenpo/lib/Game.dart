import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  
  var _imageApp = AssetImage("images/padrao.png");

  void onOptionSelected(String option) {
    print("Option selected: $option");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Jokenpo")
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.yellow)
        ),
        child: Column(
          children: <Widget>[
            const Padding(
                 padding: EdgeInsets.only(top: 32, bottom: 16),
               child: Text(
                 "Escolha do App",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                 ),
               ),
             ),
            Image(image: _imageApp,),
            const  Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => onOptionSelected("pedra"),
                  child: Image.asset("images/pedra.png", height: 100,)
                ),
                GestureDetector(
                    onTap: () => onOptionSelected("papel"),
                    child: Image.asset("images/papel.png", height: 100)
                ),
                GestureDetector(
                    onTap: () => onOptionSelected("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 100)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
