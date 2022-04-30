import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

enum Result {
  victory,
  defeat,
  draw
}

class _GameState extends State<Game> {
  
  var _imageApp = AssetImage("images/padrao.png");
  var _messageResult = "Escolha uma opção abaixo";

  void onOptionSelected(String optionSelected) {
    print("Option selected: $optionSelected");
    final options = ["pedra", "papel", "tesoura"];
    final index = Random().nextInt(options.length);
    final optionApp = options[index];
    print("Option app: $optionApp");

    final result = validateUserWin(optionSelected, optionApp);
    final message = getMessageByResult(result);

    setState(() {
      _messageResult = message;
      _imageApp = AssetImage("images/$optionApp.png", );
    });
  }

  String getMessageByResult(Result result) {
    switch(result){
      case Result.victory:
        return "Parabéns!!! você ganhou :)";
      case Result.defeat:
        return "Você perdeu :(";
      case Result.draw:
        return "Empatamos ;)";
    }
  }

  Result validateUserWin(String optionSelected, String optionApp) {
    if (optionSelected == optionApp) {
      return Result.draw;
    } else {
      final isUserWin = (optionSelected == "pedra" && optionApp == "tesoura") ||
          (optionSelected == "tesoura" && optionApp == "papel") ||
          (optionSelected == "papel" && optionApp == "pedra");
      return isUserWin ? Result.victory : Result.defeat;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Jokenpo")
      ),
      body: SizedBox(
        /*decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.yellow)
        ),*/
        width: double.infinity,
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
              Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _messageResult,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
