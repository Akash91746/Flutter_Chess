import 'package:chess_flutter/models/piece_helper.dart';
import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/providers/chess_piece_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MoveDetector extends StatefulWidget {
  final width = 60.0;
  final height = 60.0;

  const MoveDetector({Key key}) : super(key: key);

  @override
  _MoveDetectorState createState() => _MoveDetectorState();
}

class _MoveDetectorState extends State<MoveDetector> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChessTracker>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: provider.playerStatus == PlayerStatus.whiteTurn
                ? Border.all(
                    width: 1,
                    color: Colors.redAccent,
                  )
                : null,
          ),
          child: Card(
            shape: CircleBorder(),
            child: Row(
              children: [
                Image(
                  width: widget.width,
                  height: widget.height,
                  image:
                      AssetImage(PieceHelper.getPiece(PieceHolder.kingWhite)),
                ),
              ],
            ),
          ),
        ),
        if (provider.winnerText != null &&
            provider.playerStatus == PlayerStatus.notActive)
          Text(
            provider.winnerText,
            textAlign: TextAlign.center,
            softWrap: true,
            style: Theme.of(context).textTheme.headline4,
            overflow: TextOverflow.clip,
          ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: provider.playerStatus == PlayerStatus.blackTurn
                ? Border.all(
                    width: 1,
                    color: Colors.redAccent,
                  )
                : null,
          ),
          child: Card(
            shape: CircleBorder(),
            child: Row(
              children: [
                Image(
                  width: widget.width,
                  height: widget.height,
                  image:
                      AssetImage(PieceHelper.getPiece(PieceHolder.kingBlack)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
