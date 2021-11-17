import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/models/chess_tile.dart';

class King {
  static const _maxMove = 1;
  List<List<int>> _moves = [];
  PieceHolder _pieceHolder;
  PieceHolder _pieceType;

  King(this._pieceHolder) {
    _pieceType = PieceHolderChecker.getChessType(_pieceHolder);
  }

  List<List<int>> getMoves(
      List<List<ChessTile>> chessBoard, var rowPos, var columnPos) {
    _moves.add([rowPos,columnPos]);
    var rowIncrement, columnIncrement;
    bool incrementVal = columnPos <= 6;
    bool decrementVal = columnPos >= 1;
    bool rowIncrementVal = rowPos <= 6;
    bool rowDecrementVal = rowPos >= 1;

    if (rowIncrementVal) {
      rowIncrement = rowPos + _maxMove;
      addToList(chessBoard, rowIncrement, columnPos);
      if (incrementVal) {
        columnIncrement = columnPos + _maxMove;
        addToList(chessBoard, rowIncrement, columnIncrement);
      }
      if (decrementVal) {
        columnIncrement = columnPos - _maxMove;
        addToList(chessBoard, rowIncrement, columnIncrement);
      }
    }

    if (incrementVal) {
      columnIncrement = columnPos + _maxMove;
      addToList(chessBoard, rowPos, columnIncrement);
    }

    if (decrementVal) {
      columnIncrement = columnPos - _maxMove;
      addToList(chessBoard, rowPos, columnIncrement);
    }

    if (rowDecrementVal) {
      rowIncrement = rowPos - _maxMove;
      addToList(chessBoard, rowIncrement, columnPos);
      if (incrementVal) {
        columnIncrement = columnPos + _maxMove;
        addToList(chessBoard, rowIncrement, columnIncrement);
      }
      if (decrementVal) {
        columnIncrement = columnPos - _maxMove;
        addToList(chessBoard, rowIncrement, columnIncrement);
      }
    }

    return _moves;
  }


  dynamic addToList(List<List<ChessTile>> chessBoard, var row, var column) {
    PieceHolder type =
        PieceHolderChecker.getChessType(chessBoard[row][column].chessPiece);
    if (_pieceType == PieceHolder.whitePiece) {
      if (type == PieceHolder.blankPiece) {
        _moves.add([row, column]);
        return;
      }
      if (type == PieceHolder.whitePiece) {
        return;
      }
      if (type == PieceHolder.blackPiece) {
        _moves.add([row, column]);
        return;
      }
    } else {
      if (type == PieceHolder.blankPiece) {
        _moves.add([row, column]);
        return;
      }
      if (type == PieceHolder.whitePiece) {
        _moves.add([row, column]);
        return;
      }
      if (type == PieceHolder.blackPiece) {
        return;
      }
    }
  }
}
