import 'package:chess_flutter/models/chess_tile.dart';
import 'package:chess_flutter/models/piece_holder.dart';

class Rook {
  static const _maxMove = 7;
  static const _minMove = 0;
  List<List<int>> _moves = [];
  PieceHolder _mPieceHolder;
  Rook(this._mPieceHolder);

  List<List<int>> getMoves(
      List<List<ChessTile>> chessBoard, var rowPos, var columnPos) {

    _moves.add([rowPos,columnPos]);
    for (var i = columnPos + 1; i <= _maxMove; i++) {
      var chessPieceType =
          PieceHolderChecker.getChessType(chessBoard[rowPos][i].chessPiece);
      if (addToList(rowPos, i, chessPieceType)) {
        break;
      }
    }

    for (var i = columnPos - 1; i >= _minMove; i--) {
      var chessPieceType =
          PieceHolderChecker.getChessType(chessBoard[rowPos][i].chessPiece);
      if (addToList(rowPos, i, chessPieceType)) {
        break;
      }
    }
      for (var i = rowPos + 1; i <= _maxMove; i++) {
        var chessPieceType =
        PieceHolderChecker.getChessType(chessBoard[i][columnPos].chessPiece);
        if (addToList(i, columnPos, chessPieceType)) {
          break;
        }
      }

      for (var i = rowPos - 1; i >= _minMove; i--) {
        var chessPieceType =
        PieceHolderChecker.getChessType(chessBoard[i][columnPos].chessPiece);
        if (addToList(i, columnPos, chessPieceType)) {
          break;
        }
      }

    return _moves;
  }

  bool addToList(var row, var column, var chessPieceType) {
    var returnVal = false;
    if(_mPieceHolder == PieceHolder.rookWhite || _mPieceHolder == PieceHolder.queenWhite) {
      if(chessPieceType != PieceHolder.blankPiece ) {
        if (chessPieceType == PieceHolder.whitePiece) {
          returnVal = true;
        }
        if (chessPieceType == PieceHolder.blackPiece) {
          _moves.add([row, column]);
          returnVal = true;
        }
      }else{
        _moves.add([row, column]);
        returnVal = false;
      }
    }else{
      if(chessPieceType != PieceHolder.blankPiece){
        if(chessPieceType == PieceHolder.whitePiece){
          _moves.add([row,column]);
          returnVal = true;
        }
        if(chessPieceType == PieceHolder.blackPiece){
          returnVal = true;
        }
      }else{
        _moves.add([row,column]);
        returnVal = false;
      }
    }
    return returnVal;
  }
}
