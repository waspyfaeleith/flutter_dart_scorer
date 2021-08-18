import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logic/Match.dart';
import 'logic/Throw.dart';

class GameScreen extends StatefulWidget {
  static String id = 'game_screen';

  Match match;

  GameScreen({Key? key, required this.match}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late Match match;
  final controller =  TextEditingController();

  void initState() {
    match = widget.match;
    //match.play();
  }

  void throwDarts(int score) {
    setState(() {
      if (!match.matchWon())
      {
        match.processScore(score);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('${match.players[0].legsWon}'),
                        Text('${match.players[0].setsWon}'),
                        Text('${match.players[0].name}'),
                        Text('${match.players[0].currentScore}')
                      ],
                    ),
                    Column(
                      children: [
                        Text("Legs"),
                        Text("Sets")
                      ],
                    ),
                    Column(
                      children: [
                        Text('${match.players[1].legsWon}'),
                        Text('${match.players[1].setsWon}'),
                        Text('${match.players[1].name}'),
                        Text('${match.players[1].currentScore}')
                      ],)
                  ],
                ),
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
                  Container(
                    margin: EdgeInsets.all(20),
                    child: MaterialButton(
                      child: Text('Submit Score'),
                      onPressed: () {
                        throwDarts(int.parse(controller.text));
                      },
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}