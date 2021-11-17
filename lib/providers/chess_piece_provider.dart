import 'package:chess_flutter/models/chess_tree.dart';
import 'package:chess_flutter/widgets/checkBox_piece.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chess_flutter/models/piece_holder.dart';
import 'package:chess_flutter/models/piece_helper.dart';
import 'package:chess_flutter/models/chess_tile.dart';
import '../models/moves/move_helper.dart';

enum PlayerStatus {
  notActive,
  whiteTurn,
  blackTurn,
}

class ChessTracker with ChangeNotifier {
  static const _rowSize = 8;
  static const _columnSize = 8;

  int _tapCounter;

  int _oldRow;
  int _oldColumn;
  int _newRow;
  int _newColumn;
  var _defaultMoves;

  PlayerStatus _playerStatus;

  String _winnerText;
  List<List<ChessTile>> _boardBlue;

  List<PieceHolder> _pawnPromotionWhite = [
    PieceHolder.queenWhite,
    PieceHolder.rookWhite,
    PieceHolder.knightWhite,
    PieceHolder.bishopWhite
  ];
  List<PieceHolder> _pawnPromotionBlack = [
    PieceHolder.queenBlack,
    PieceHolder.rookBlack,
    PieceHolder.knightBlack,
    PieceHolder.bishopBlack
  ];

  void _setBoard() {
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

  ChessTracker() {
    initBoard();
  }

  void initBoard() {
    _setBoard();
    _setBlackPiece();
    _setWhitePiece();
    _tapCounter = 0;
    _playerStatus = PlayerStatus.whiteTurn;
    notifyListeners();
    NodeData.instance.init();
  }

  void _setWhitePiece() {
    List<PieceHolder> defaultWhitePieceList = [
      PieceHolder.rookWhite,
      PieceHolder.knightWhite,
      PieceHolder.bishopWhite,
      PieceHolder.queenWhite,
      PieceHolder.kingWhite,
      PieceHolder.bishopWhite,
      PieceHolder.knightWhite,
      PieceHolder.rookWhite,
    ];
    for (int i = 0; i < _rowSize; i++) {
      _boardBlue[6][i].setChessPiece(PieceHolder.pawnWhite);
    }

    for (int i = 0; i < _columnSize; i++) {
      _boardBlue[7][i].setChessPiece(defaultWhitePieceList[i]);
    }
  }

  void _setBlackPiece() {
    List<PieceHolder> defaultBlackPieceList = [
      PieceHolder.rookBlack,
      PieceHolder.knightBlack,
      PieceHolder.bishopBlack,
      PieceHolder.queenBlack,
      PieceHolder.kingBlack,
      PieceHolder.bishopBlack,
      PieceHolder.knightBlack,
      PieceHolder.rookBlack,
    ];

    for (int i = 0; i < _columnSize; i++) {
      _boardBlue[1][i].setChessPiece(PieceHolder.pawnBlack);
    }

    for (int i = 0; i < _columnSize; i++) {
      _boardBlue[0][i].setChessPiece(defaultBlackPieceList[i]);
    }
  }

  void _changeTile(BuildContext context,int oldRow, int oldIndex, int newRow, int newIndex) {
    var copyTile = _boardBlue[oldRow][oldIndex].chessPiece;
    _boardBlue[oldRow][oldIndex].setChessPiece(PieceHolder.blankPiece);

    if (!_checkForWinner(newRow, newIndex)) {
      if (_oldRow != _newRow || _oldColumn != _newColumn) {
        if (_playerStatus == PlayerStatus.whiteTurn) {
          _playerStatus = PlayerStatus.blackTurn;
        } else {
          _playerStatus = PlayerStatus.whiteTurn;
        }
      }
    }else{
      _showSnackBar(context);
    }
    _boardBlue[newRow][newIndex].setChessPiece(copyTile);
    notifyListeners();
  }

  bool _checkForWinner(var newRow, var newIndex) {
    var val = false;
    if (_boardBlue[newRow][newIndex].chessPiece == PieceHolder.kingWhite) {
      _winnerText = 'Black is Winner';
      _playerStatus = PlayerStatus.notActive;
      notifyListeners();
      val = true;
    }

    if (_boardBlue[newRow][newIndex].chessPiece == PieceHolder.kingBlack) {
      _winnerText = 'White is winner';
      _playerStatus = PlayerStatus.notActive;
      notifyListeners();
      val = true;
    }

    return val;
  }

  void onTapListener(int row, int column, PieceHolder pieceHolder,BuildContext context) {
    if (pieceHolder == PieceHolder.blankPiece && _tapCounter == 0) {
      return;
    }
    if (_playerStatus == PlayerStatus.notActive) {
      return;
    }
    if (_tapCounter == 0) {
      PieceHolder pieceType = PieceHolderChecker.getChessType(pieceHolder);
      if (_playerStatus == PlayerStatus.whiteTurn) {
        if (pieceType != PieceHolder.whitePiece) {
          return;
        }
      } else {
        if (pieceType != PieceHolder.blackPiece) {
          return;
        }
      }
      _oldRow = row;
      _oldColumn = column;
      _defaultMoves = _getMoves(row, column, pieceHolder);
      _checkMoves(false);
      _tapCounter = 1;
      return;
    }
    if (_tapCounter == 1) {
      _newRow = row;
      _newColumn = column;
      if (_checkMoves(true)) {
        _changeTile(context,_oldRow, _oldColumn, _newRow, _newColumn);
      }
      _tapCounter = 0;
    }
  }

  void _showModalSheet(
      BuildContext context, var pieceHolder, var rowPos, var columnPos) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return CheckBoxPiece(
          pieceHolder == PieceHolder.pawnWhite
              ? _pawnPromotionWhite
              : _pawnPromotionBlack,
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isDismissible: false,
    ).then((value) {
      _boardBlue[rowPos][columnPos].setChessPiece(value);
      notifyListeners();
    });
  }

  void checkModalSheetRequirement(
      var rowPos, var columnPos, var pieceHolder, BuildContext context) {
    if (pieceHolder == PieceHolder.pawnBlack ||
        pieceHolder == PieceHolder.pawnWhite) {
      if (rowPos == 0 || rowPos == 7) {
        _showModalSheet(context, pieceHolder, rowPos, columnPos);
      }
    }
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(days: 1),
        content: Text('Game Over'),
        action: SnackBarAction(
          label: 'Restart',
          textColor: Colors.greenAccent,
          onPressed: ()=>initBoard(),
        ),
      ),
    );
  }

  dynamic _checkMoves(bool returnAvail) {
    if (returnAvail) {
      return _changeGlowPiece(false);

    } else {
      _changeGlowPiece(true);
    }
  }

  dynamic _changeGlowPiece(bool isGlow) {
    var x, y;
    var isAvailable = false;

    if (_defaultMoves != null) {
      for (int i = 0; i < _defaultMoves.length; i++) {
        x = _defaultMoves[i][0];
        y = _defaultMoves[i][1];
        if (x == _newRow && y == _newColumn) {
          isAvailable = true;
        }
        if (x != null && y != null && x >= 0 && y >= 0) {
          _boardBlue[x][y].setGlowPiece(isGlow);
        }
        notifyListeners();
      }
    }
    return isAvailable;
  }

  List<List<int>> _getMoves(int row, int column, var piece) {
    var data = Move.instance.getMove(piece, row, column, _boardBlue);
    if (data == null) {
      print('no moves found');
      return null;
    }

    return data;
  }

  dynamic getPieceUsingId(var uniqueId) {
    for (int i = 0; i < _boardBlue.length; i++) {
      for (int j = 0; j < _boardBlue[i].length; j++) {
        var data = _boardBlue[i][j];
        if (data.uniqueId == uniqueId) {
          return data;
        }
      }
    }
    print('data not found');
    return null;
  }

  PlayerStatus get playerStatus {
    return this._playerStatus;
  }

  String get winnerText {
    return this._winnerText;
  }

  List<PieceHolder> get whitePiecePawnPromotion {
    return _pawnPromotionWhite;
  }

  List<PieceHolder> get blackPiecePawnPromotion {
    return this._pawnPromotionBlack;
  }

  PieceHolder getPiece(int row, int index) {
    return _boardBlue[row][index].chessPiece;
  }

  bool getGlow(int row, int index) {
    return _boardBlue[row][index].glow;
  }

  ChessTile getTileData(int row, int column) {
    return _boardBlue[row][column];
  }
}
