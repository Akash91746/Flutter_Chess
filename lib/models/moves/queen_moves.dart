import 'package:chess_flutter/models/chess_tile.dart';
import 'package:chess_flutter/models/moves/bishop_moves.dart';
import 'package:chess_flutter/models/moves/rook_moves.dart';
import 'package:chess_flutter/models/piece_holder.dart';

class Queen{

  PieceHolder _pieceHolder;
  List<List<int>> _moves=[];
  Queen(this._pieceHolder);

  List<List<int>> getMoves(List<List<ChessTile>> chessBoard,var rowPos,var columnPos){
    List<List<int>> rookMoves = Rook(_pieceHolder).getMoves(chessBoard, rowPos, columnPos);
    List<List<int>> bishopMoves = Bishop(_pieceHolder).getMoves(chessBoard, rowPos, columnPos);

    for(int i = 0;i<rookMoves.length;i++){
      _moves.add(rookMoves[i]);
    }

    for(int i = 0; i<bishopMoves.length;i++){
      _moves.add(bishopMoves[i]);
    }
    return _moves;
  }

}