import 'package:flutter/material.dart';
import 'logic/Match.dart';

class GameScreen extends StatefulWidget {
  static String id = 'game_screen';

  final Match match;

  GameScreen({Key? key, required this.match}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text('${widget.match.players[0].legsWon}'),
              Text('${widget.match.players[0].setsWon}'),
              Text('${widget.match.players[0].name}'),
              Text('${widget.match.players[0].currentScore}')
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
              Text('${widget.match.players[1].legsWon}'),
              Text('${widget.match.players[1].setsWon}'),
              Text('${widget.match.players[1].name}'),
              Text('${widget.match.players[1].currentScore}')
            ],)
        ],
      ),
    );
  }
}