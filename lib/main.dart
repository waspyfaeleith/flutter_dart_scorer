import 'package:flutter/material.dart';
import 'package:flutter_dart_scorer/game_screen.dart';

import 'components/player_name_input.dart';
import 'logic/Player.dart';
import 'logic/Match.dart';

void main() {
  runApp(DartScorer());
}

class DartScorer extends StatelessWidget {
  static String id = 'home_screen';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dart Scorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: "Let's play darts!!!"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String player1Name = "Player 1";
  String player2Name = "Player 2";
  int startScore = 501;
  int sets = 3;
  int legsPerSet = 5;

  void updatePlayer1(text) {
      setState(() {
        player1Name = text;
      });
  }

  void updatePlayer2(text) {
    setState(() {
      player2Name = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
            // PlayerNameInput(player1, updatePlayer1),
            // PlayerNameInput(player2, updatePlayer2),
            Row(
              children: [
            Expanded(
                //margin: EdgeInsets.all(20),
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Player/Team 1',
                    ),
                    onChanged: (text) {
                      setState(() {
                        player1Name = text;
                      });
                    },
                  ),
                )
            ),
                Expanded(
                    //margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Player/Team 2',
                        ),
                        onChanged: (text) {
                          setState(() {
                            player2Name = text;
                          });
                        },
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (int? newValue) {
                    setState(() {
                      startScore = newValue!;
                    });
                  },
                  items: <int>[301, 501, 701]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('${value}'),
                    );
                  }).toList(),
                ),
                DropdownButton(
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (int? newValue) {
                    setState(() {
                      sets = newValue!;
                    });
                  },
                  items: <int>[1, 3, 5, 7, 9, 11, 13]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('${value}'),
                    );
                  }).toList(),
                ),
                DropdownButton(
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (int? newValue) {
                    setState(() {
                      legsPerSet = newValue!;
                    });
                  },
                  items: <int>[1, 3, 5, 7]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('${value}'),
                    );
                  }).toList(),
                ),

              ]
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(player1Name + " vs " + player2Name),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text("${startScore} start "),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text("Best of ${sets} sets "),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text("Best of ${legsPerSet} legs per set "),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: MaterialButton(
                child: Text('Start Match'),
                onPressed: () {
                  print("Game On!!!!");
                  Player player1 = new Player(player1Name, startScore);
                  Player player2 = new Player(player2Name, startScore);
                  Match match = new Match( player1, player2, sets, legsPerSet, startScore);
                  //Navigator.pushNamed(context, GameScreen.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(match: match)
                    ),
                  );

                },
              ),
            ),
          ],
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
