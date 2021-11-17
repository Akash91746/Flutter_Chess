import 'piece_holder.dart';
import 'pieces_const.dart';

class PieceHelper {
  static int getRowIdentifier(int row) {
    int mRow;

    switch (row) {
      case 0:
        mRow = 8;
        break;
      case 1:
        mRow = 7;
        break;
      case 2:
        mRow = 6;
        break;
      case 3:
        mRow = 5;
        break;
      case 4:
        mRow = 4;
        break;
      case 5:
        mRow = 3;
        break;
      case 6:
        mRow = 2;
        break;
      case 7:
        mRow = 1;
        break;
      default:
        print('Error Found');
        mRow = null;
        break;
    }
    return mRow;
  }

  static dynamic getColumnIdentifier(int index) {
    var mColumn;

    switch (index) {
      case 0:
        mColumn = 'a';
        break;
      case 1:
        mColumn = 'b';
        break;
      case 2:
        mColumn = 'c';
        break;
      case 3:
        mColumn = 'd';
        break;
      case 4:
        mColumn = 'e';
        break;
      case 5:
        mColumn = 'f';
        break;
      case 6:
        mColumn = 'g';
        break;
      case 7:
        mColumn = 'h';
        break;
      default:
        print('Unidentified Index');
        mColumn = null;
        break;
    }
    return mColumn;
  }
  static dynamic getDefaultRow(int row){
    int mRow;

    switch (row) {
      case 8:
        mRow = 0;
        break;
      case 7:
        mRow = 1;
        break;
      case 6:
        mRow = 2;
        break;
      case 5:
        mRow = 3;
        break;
      case 4:
        mRow = 4;
        break;
      case 3:
        mRow = 5;
        break;
      case 2:
        mRow = 6;
        break;
      case 1:
        mRow = 7;
        break;
      default:
        print('Error Found');
        mRow = null;
        break;
    }
    return mRow;
  }

  static dynamic getDefaultColumn(var column) {
    var mColumn;

    switch (column) {
      case 'a':
        mColumn = 0;
        break;
      case 'b':
        mColumn = 1;
        break;
      case 'c':
        mColumn = 2;
        break;
      case 'd':
        mColumn = 3;
        break;
      case 'e':
        mColumn = 4;
        break;
      case 'f':
        mColumn = 5;
        break;
      case 'g':
        mColumn = 6;
        break;
      case 'h':
        mColumn = 7;
        break;
      default:
        print('Unidentified Index');
        mColumn = null;
        break;
    }
    return mColumn;
  }

  static dynamic getPiece(var piece) {
    var mPiece;
    switch (piece) {
      //no piece on tile
      case PieceHolder.blankPiece:
        mPiece = null;
        break;
      case PieceHolder.pawnWhite:
        mPiece = WhitePieces.pawn;
        break;
      case PieceHolder.bishopWhite:
        mPiece = WhitePieces.bishop;
        break;
      case PieceHolder.kingWhite:
        mPiece = WhitePieces.king;
        break;
      case PieceHolder.knightWhite:
        mPiece = WhitePieces.knight;
        break;
      case PieceHolder.queenWhite:
        mPiece = WhitePieces.queen;
        break;
      case PieceHolder.rookWhite:
        mPiece = WhitePieces.rook;
        break;
      case PieceHolder.pawnBlack:
        mPiece = BlackPieces.pawn;
        break;
      case PieceHolder.bishopBlack:
        mPiece = BlackPieces.bishop;
        break;
      case PieceHolder.kingBlack:
        mPiece = BlackPieces.king;
        break;
      case PieceHolder.knightBlack:
        mPiece = BlackPieces.knight;
        break;
      case PieceHolder.queenBlack:
        mPiece = BlackPieces.queen;
        break;
      case PieceHolder.rookBlack:
        mPiece = BlackPieces.rook;
        break;
    }
    return mPiece;
  }
}
