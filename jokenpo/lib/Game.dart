import 'dart:math';
import 'package:flutter/material.dart';
import 'Option.dart';
import 'Result.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  
  var _imageApp = const AssetImage("images/padrao.png");
  var _messageResult = "Escolha uma opção abaixo";
  var _colorPedra = Colors.transparent;
  var _colorPapel = Colors.transparent;
  var _colorTesoura= Colors.transparent;

  void onOptionSelected(Option optionSelected) {

    print("Option selected: $optionSelected");
    final index = Random().nextInt(Option.values.length);
    final optionApp = Option.values[index];
    print("Option app: $optionApp");

    final result = validateUserWin(optionSelected, optionApp);
    final message = getMessageByResult(result);

    setState(() {
      _colorPedra = getColorByOption(optionSelected, Option.pedra);
      _colorPapel = getColorByOption(optionSelected, Option.papel);
      _colorTesoura = getColorByOption(optionSelected, Option.tesoura);
      _messageResult = message;
      _imageApp = AssetImage("images/${optionApp.name}.png");
    });
  }

  Color getColorByOption(Option optionSelected, Option option) {
      return optionSelected == option ? Colors.blue : Colors.transparent;
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

  Result validateUserWin(Option optionSelected, Option optionApp) {
    if (optionSelected == optionApp) {
      return Result.draw;
    } else {
      final isUserWin = (optionSelected == Option.pedra && optionApp == Option.tesoura) ||
          (optionSelected == Option.tesoura && optionApp == Option.papel) ||
          (optionSelected == Option.papel && optionApp == Option.pedra);
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
            Image(image: _imageApp),
              Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
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
                  onTap: () => onOptionSelected(Option.pedra),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: _colorPedra,
                      child: Padding(
                        padding: const EdgeInsets.all(4), // Border radius
                        child: ClipOval(
                            child: Image.asset("images/pedra.png",)
                        ),
                      ),
                    )
                ),
                GestureDetector(
                    onTap: () => onOptionSelected(Option.papel),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: _colorPapel,
                      child: Padding(
                        padding: const EdgeInsets.all(4), // Border radius
                        child: ClipOval(
                            child: Image.asset("images/papel.png",)
                        ),
                      ),
                    )
                ),
                GestureDetector(
                    onTap: () => onOptionSelected(Option.tesoura),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: _colorTesoura,
                      child: Padding(
                        padding: const EdgeInsets.all(4), // Border radius
                        child: ClipOval(
                            child: Image.asset("images/tesoura.png",)
                        ),
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
