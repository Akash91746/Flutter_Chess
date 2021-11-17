import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chess_flutter/providers/chess_piece_provider.dart';
import 'package:chess_flutter/models/chess_tile.dart';
import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/models/piece_helper.dart';

class ChessPiece extends StatelessWidget {
  final mColumn;
  final mColor;
  final mRow;

  ChessPiece({
    Key key,
    @required this.mRow,
    @required this.mColumn,
    @required this.mColor,
  }) : super(key: key);


  Widget getGridTile(BuildContext context) {
    var provider = Provider.of<ChessTracker>(context);
    ChessTile tileData = provider.getTileData(mRow, mColumn);
    return GestureDetector(
      onTap: () {
        provider.onTapListener(mRow, mColumn, tileData.chessPiece, context);
        provider.checkModalSheetRequirement(mRow, mColumn, tileData.chessPiece, context);
      },
      child: GridTile(
        child: Stack(
          children: [
              Consumer<ChessTracker>(
                builder: (ctx,data,ch){
                  if(data.getGlow(mRow, mColumn)){
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5,color: Colors.redAccent),
                        color: mColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue.shade100,
                          size:16,
                        ),
                      ),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: mColor,
                    ),
                  );
                },
              ),
              Consumer<ChessTracker>(
                builder: (ctx,data,ch){
                  if(data.getTileData(mRow, mColumn).chessPiece != PieceHolder.blankPiece){
                    return ch;
                  }else{
                    return Container();
                  }
                },
                child: Center(
                  child: Image(
                    image: AssetImage(
                      '${PieceHelper.getPiece(tileData.chessPiece)}',
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getGridTile(context);
  }
}
