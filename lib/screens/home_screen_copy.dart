import 'package:chess_flutter/providers/chess_piece_provider.dart';
import 'package:flutter/material.dart';
import 'package:chess_flutter/widgets/chess_board.dart';
import 'package:provider/provider.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChessTracker>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Test2'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: provider.playerStatus == PlayerStatus.notActive
                  ? Center(
                      child: Text(
                        provider.winnerText,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    )
                  : Container(),
            ),
            ChessBoard(),
            Container(
              child: provider.playerStatus == PlayerStatus.notActive
                  ? ElevatedButton(
                      onPressed: () => provider.initBoard(),
                      child: Text('Play Again'),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
