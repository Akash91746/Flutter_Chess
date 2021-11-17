import 'package:chess_flutter/models/moves/bishop_moves.dart';
import 'package:chess_flutter/models/moves/king_moves.dart';
import 'package:chess_flutter/models/moves/knight_moves.dart';
import 'package:chess_flutter/models/moves/pawn_moves.dart';
import 'package:chess_flutter/models/moves/queen_moves.dart';
import 'package:chess_flutter/models/moves/rook_moves.dart';
import 'package:chess_flutter/models/piece_holder.dart';

class Move {
  Move._privateConstructor();

  static final Move _instance = Move._privateConstructor();

  static Move get instance => _instance;

  List<List<int>> getMove(
      PieceHolder pieceHolder, int rowPos, int columnPos, var chessBoard){
    switch (pieceHolder) {
      case PieceHolder.blankPiece:
        return null;
      case PieceHolder.pawnWhite:
        return Pawn(pieceHolder).getMoves(rowPos, columnPos, chessBoard);
      case PieceHolder.pawnBlack:
        return Pawn(pieceHolder).getMoves(rowPos, columnPos, chessBoard);
      case PieceHolder.rookWhite:
        return Rook(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.rookBlack:
        return Rook(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.bishopWhite:
        return Bishop(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.bishopBlack:
        return Bishop(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.knightWhite:
        return Knight(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.knightBlack:
        return Knight(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.queenWhite:
        return Queen(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.queenBlack:
        return Queen(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.kingWhite:
        return King(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.kingBlack:
        return King(pieceHolder).getMoves(chessBoard, rowPos, columnPos);
      case PieceHolder.whitePiece:
        return null;
      case PieceHolder.blackPiece:
        return null;
    }
    return null;
  }
}
