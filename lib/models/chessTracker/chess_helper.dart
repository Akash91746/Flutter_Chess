import 'package:chess_flutter/models/chess_tile.dart';
import 'package:chess_flutter/models/piece_helper.dart';
import 'package:chess_flutter/models/piece_holder.dart';

class ChessBoard{
  static List<List<ChessTile>> _boardBlue;
  final _rowSize = 8;
  final _columnSize = 8;

  ChessBoard(){
    initializeChessBoard();
  }

  ChessBoard.privateConstructor();
  static final ChessBoard _instance = ChessBoard.privateConstructor();
  static ChessBoard get instance => _instance;

  void initializeChessBoard(){
    _boardBlue = List.generate(
      _rowSize,
          (row) => List.generate(
        _columnSize,
            (column) => ChessTile(
          '${PieceHelper.getRowIdentifier(row)}${PieceHelper.getColumnIdentifier(column)}',
          PieceHolder.blankPiece,
          false,
        ),
      ),
    );
  }

  void updateList(){

  }

}