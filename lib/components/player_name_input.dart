import 'package:flutter/material.dart';

class PlayerNameInput extends StatefulWidget {
  final String player;
  final Function onChanged;

  PlayerNameInput(this.player, this.onChanged);

  @override
  _PlayerNameInputState createState() => _PlayerNameInputState();
}

class _PlayerNameInputState extends State<PlayerNameInput> {
  late String player;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child:
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.player,
          ),
          onChanged: widget.onChanged("Boo"),
        )
      );
    }
}