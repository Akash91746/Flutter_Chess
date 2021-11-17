import 'package:chess_flutter/models/piece_helper.dart';
import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/providers/chess_piece_provider.dart';
import 'package:chess_flutter/widgets/move_detector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chess_flutter/widgets/chess_board.dart';

class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    var provider = Provider.of<ChessTracker>(context);

    PreferredSizeWidget appBar() {
      return AppBar(
        title: const Text('Chess'),
        actions: [
          PopupMenuButton(
            onSelected: (val) {
              provider.initBoard();
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  child: const Text('Reset'),
                  value: '',
                )
              ];
            },
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MoveDetector(),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.brown.shade400),
                ),
                padding: EdgeInsets.all(4),
                child: ChessBoard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
