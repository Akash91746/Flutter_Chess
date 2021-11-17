import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/models/chess_tile.dart';

class Knight{

  static const _maxMove = 2;
  static const _maxBoardSize = 7;

  PieceHolder _pieceHolder;
  List<List<int>> _moves=[];
  PieceHolder _pieceType ;

  Knight(this._pieceHolder){
    _pieceType = PieceHolderChecker.getChessType(this._pieceHolder);
  }

  List<List<int>> getMoves(List<List<ChessTile>> chessBoard, var rowPos, var columnPos){

    var rightMoves = _maxBoardSize - columnPos ;
    var leftMoves = _maxBoardSize - rightMoves;
    var bottomMoves = _maxBoardSize - rowPos;
    var topMoves = _maxBoardSize - bottomMoves;

    var columnIncrement ;
    var rowIncrement;

    _moves.add([rowPos,columnPos]);

    if(rightMoves >= _maxMove){
      columnIncrement = columnPos + 2;
      addHorizontalMoves(chessBoard,columnIncrement, rowPos, bottomMoves, topMoves);
    }

    if(leftMoves >=_maxMove){
      columnIncrement = columnPos - 2;
      addHorizontalMoves(chessBoard,columnIncrement, rowPos, bottomMoves, topMoves);
    }

    if(topMoves >=_maxMove){
      rowIncrement = rowPos - 2;
      addVerticalMoves(chessBoard,rowIncrement, columnPos, rightMoves, leftMoves);
    }

    if(bottomMoves >= _maxMove){
      rowIncrement = rowPos +2;
      addVerticalMoves(chessBoard,rowIncrement, columnPos, rightMoves, leftMoves);
    }

    return _moves;
  }
  dynamic addVerticalMoves(var chessBoard,var rowIncrement,var columnPos,var rightMoves,var leftMoves){
    var columnIncrement;
    if(rightMoves>=1){
      columnIncrement = columnPos +1;
      addToList(chessBoard, rowIncrement,columnIncrement );
    }
    if(leftMoves>=1){
      columnIncrement = columnPos -1;
      addToList(chessBoard, rowIncrement, columnIncrement);
    }
  }

  dynamic addHorizontalMoves(var chessBoard,var columnIncrement,var rowPos,var bottomMoves,var topMoves){
    var rowIncrement;
    if(bottomMoves>=1){
      rowIncrement = rowPos + 1;
      addToList(chessBoard, rowIncrement, columnIncrement);
    }
    if(topMoves>=1){
      rowIncrement = rowPos - 1;
      addToList(chessBoard, rowIncrement, columnIncrement);
    }
  }

  dynamic addToList(List<List<ChessTile>> chessBoard,var row,var column){
    PieceHolder type = PieceHolderChecker.getChessType(chessBoard[row][column].chessPiece);
    if(_pieceType == PieceHolder.whitePiece) {
      if (type == PieceHolder.blankPiece) {
        _moves.add([row, column]);
        return;
      }
      if(type == PieceHolder.whitePiece){
        return;
      }
      if(type == PieceHolder.blackPiece){
        _moves.add([row,column]);
        return;
      }
    }else{
      if (type == PieceHolder.blankPiece) {
        _moves.add([row, column]);
        return;
      }
      if(type == PieceHolder.whitePiece){
        _moves.add([row,column]);
        return;
      }
      if(type == PieceHolder.blackPiece){
        return;
      }
    }
  }

}