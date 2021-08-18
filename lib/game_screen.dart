import 'package:flutter/material.dart';
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

  void initState() {
    match = widget.match;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}