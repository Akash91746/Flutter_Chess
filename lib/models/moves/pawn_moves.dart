import 'dart:async';

import '../piece_holder.dart';
import '../chess_tile.dart';

class Pawn {
  static const _maxAttackMove = 1;
  static var _maxMove; // 1 for black piece -1 for white piece
   List<List<int>> _moves = [];

   PieceHolder _pawnPieceType;
   PieceHolder _pieceType;

  Pawn(this._pawnPieceType) {
    _pieceType = PieceHolderChecker.getChessType(_pawnPieceType);
    _pawnPieceType == PieceHolder.pawnBlack ? _maxMove = 1 : _maxMove = -1;
  }

   List<List<int>> getMoves (
      var rowPos, var columnPos, List<List<ChessTile>> chessBoard) {

    Future.sync(() {

      var xPos = rowPos;
      var yMove = columnPos + _maxAttackMove;
      var yDecMove = columnPos - _maxAttackMove;
      _moves.add([rowPos,columnPos]);

      if (xPos >= 0 && xPos <= 7) {
        xPos += _maxMove;
        bool shouldAddNextMove = false;
        bool isTileAvailable=xPos<=7&& xPos>=0;

        if(isTileAvailable) {
          shouldAddNextMove = addToList(chessBoard, xPos, columnPos);
        }
        if (yMove <= 7 && yMove >= 0 && isTileAvailable) {
          addMoveToLeftAndRight(chessBoard, xPos, yMove);
        }
        if (yDecMove <= 7 && yDecMove >= 0 && isTileAvailable) {
          addMoveToLeftAndRight(chessBoard, xPos, yDecMove);
        }

        if (rowPos == 1 || rowPos == 6 && shouldAddNextMove) {
          xPos += _maxMove;
          if (xPos <= 7 && xPos >= 0) {
            addToList(chessBoard, xPos, columnPos);
          }
        }
      }
    });

    return _moves;
  }

   dynamic addMoveToLeftAndRight(
      List<List<ChessTile>> chessBoard, var rowPos, var columnPos) {

    PieceHolder type = PieceHolderChecker.getChessType(
        chessBoard[rowPos][columnPos].chessPiece);

    if (_pieceType == PieceHolder.whitePiece) {
      if (type == PieceHolder.blackPiece) {
        _moves.add([rowPos, columnPos]);
        return;
      }
    } else {
      if (type == PieceHolder.whitePiece) {
        _moves.add([rowPos, columnPos]);
        return;
      }
    }
  }

   bool addToList(List<List<ChessTile>> chessBoard, var row, var column) {
    PieceHolder type =
        PieceHolderChecker.getChessType(chessBoard[row][column].chessPiece);

    if (type == PieceHolder.blankPiece) {
      _moves.add([row, column]);
      return true;
    }
    return false;
  }
}
