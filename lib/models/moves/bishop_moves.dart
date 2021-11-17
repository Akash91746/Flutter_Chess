import 'dart:math';

import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/models/chess_tile.dart';
class Bishop{

  static const _maxMove = 7;
  final PieceHolder _mPieceHolder;
  List<List<int>> _moves=[];

  Bishop(this._mPieceHolder);

  List<List<int>> getMoves(List<List<ChessTile>> chessBoard,var rowPos,var columnPos){
    _moves.add([rowPos,columnPos]);
    var rightSpace = _maxMove - columnPos ;
    var leftSpace = _maxMove - rightSpace ;
    var bottomSpace = _maxMove - rowPos;
    var topSpace = _maxMove - bottomSpace;

    var bottomRightMaxMove = min(rightSpace, bottomSpace);
    var bottomLeftMaxMove = min(leftSpace,bottomSpace);
    var topRightMaxMove = min(topSpace,rightSpace);
    var topLeftMaxMove = min(topSpace,leftSpace);

    int i =0;
    var rowPosCopy = rowPos;
    var columnPosCopy = columnPos;

    while(i != bottomRightMaxMove){
      ++rowPosCopy;
      ++columnPosCopy;

      if(addToList(rowPosCopy, columnPosCopy, chessBoard)){
        break;
      }
      i++;
    }
    
    i=0;
    rowPosCopy = rowPos;
    columnPosCopy = columnPos;

    while(i!=bottomLeftMaxMove){
      ++rowPosCopy;
      --columnPosCopy;

      if(addToList(rowPosCopy, columnPosCopy,chessBoard)){
        break;
      }
      i++;
    }

    i=0;
    rowPosCopy = rowPos;
    columnPosCopy = columnPos;

    while(i!=topRightMaxMove){
      --rowPosCopy;
      ++columnPosCopy;

      if(addToList(rowPosCopy, columnPosCopy, chessBoard)){
        break;
      }
      i++;
    }

    i=0;
    rowPosCopy = rowPos;
    columnPosCopy = columnPos;

    while(i!=topLeftMaxMove){

      --rowPosCopy;
      --columnPosCopy;
      if(addToList(rowPosCopy, columnPosCopy, chessBoard)){
        break;
      }
      i++;
    }

    return _moves;
  }

  bool addToList(int rowPos,int columnPos,List<List<ChessTile>> board){
    var returnVal = false;
    var pieceType = PieceHolderChecker.getChessType(board[rowPos][columnPos].chessPiece);
    if(_mPieceHolder == PieceHolder.bishopWhite || _mPieceHolder == PieceHolder.queenWhite) {
      if (pieceType == PieceHolder.blankPiece) {
        _moves.add([rowPos, columnPos]);
      }
      if(pieceType==PieceHolder.whitePiece){
        returnVal = true;
      }
      if(pieceType== PieceHolder.blackPiece){
        _moves.add([rowPos,columnPos]);
        returnVal = true;
      }
    }else{
      if(pieceType == PieceHolder.blankPiece){
        _moves.add([rowPos,columnPos]);
      }
      if(pieceType == PieceHolder.whitePiece){
        _moves.add([rowPos,columnPos ]);
        returnVal = true;
      }
      if(pieceType == PieceHolder.blackPiece){
        returnVal = true;
      }
    }

    return returnVal;
  }

}