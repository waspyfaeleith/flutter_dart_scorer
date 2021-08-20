import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logic/Match.dart';

class GameScreen extends StatefulWidget {
  static String id = 'game_screen';

  Match match;

  GameScreen({Key? key, required this.match}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late Match match;
  late String player1NameText = "";
  late String player2NameText = "";
  late String player1SetsWonText = "";
  late String player2SetsWonText = "";
  late String player1LegsWonText = "";
  late String player2LegsWonText = "";
  late String player1CurrentScoreText = "";
  late String player2CurrentScoreText = "";
  late String messageText = "";


  final controller =  TextEditingController();

  void initState() {
    match = widget.match;
    updateTextFields();
  }

  void updateTextFields() {
    setState(() {
      player1SetsWonText = "${match.game.player1.setsWon}";
      player1LegsWonText = "${match.game.player1.legsWon}";
      player1CurrentScoreText = "${match.game.player1.currentScore}";

      player2SetsWonText = "${match.game.player2.setsWon}";
      player2LegsWonText = "${match.game.player2.legsWon}";
      player2CurrentScoreText = "${match.game.player2.currentScore}";

      messageText = match.message;
    });


  }
  void throwDarts(int score) {
    controller.clear();
    if (!match.matchWon())
    {
      match.processScore(score);
    }
    setState(() {
      updateTextFields();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(player1LegsWonText),
                          Text(player1SetsWonText),
                          Text('${match.game.player1.name}'),
                          Text(player1CurrentScoreText),
                        ],
                      ),
                    ),
                    Expanded(
                    child:
                    Column(
                      children: [
                        Text("Legs"),
                        Text("Sets"),
                        Text("V"),
                      ],
                    ),
                    ),
                    Expanded(
                      child: Column(
                      children: [
                        Text(player2LegsWonText),
                        Text(player2SetsWonText),
                        Text('${match.game.player2.name}'),
                        Text(player2CurrentScoreText),
                      ],
                        ),
                    ),
                  ],
                ),
              Row(
                children: [
                  Center(
                    child: Expanded(
                        child: Text(match.message)
                    ),
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: new InputDecoration(labelText: "Enter score"),
                        keyboardType: TextInputType.number,
                        controller: controller,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Center(
                    child: Container(
                        margin: EdgeInsets.all(20),
                        child: MaterialButton(
                          child: Text('Submit Score'),
                          onPressed: () {
                            throwDarts(int.parse(controller.text));
                          },
                        )
                    ),
                  ),
                ],
              )
            ],
        ),
      ),
    );
  }
}