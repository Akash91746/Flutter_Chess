import 'package:flutter/material.dart';
import 'package:chess_flutter/widgets/piece_widget.dart';

class ChessBoard extends StatefulWidget {

  ChessBoard({Key key}) : super(key: key);
  static final totalPiece = 64;
  static final crossAxisCount = 8;

  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {

  List<int> _breakingPointList = [];
  int _row = 0;
  int _changeIndex = 0;

  @override
  void initState() {
    super.initState();
    setBreakingPoint();
  }

  void setBreakingPoint() {
    var point = 8;
    _breakingPointList.add(point);
    while ((point += ChessBoard.crossAxisCount) != ChessBoard.totalPiece) {
      _breakingPointList.add(point);
    }
  }

  dynamic checkColor(int index) {
    var color;
    if (_row.isEven) {
      index.isOdd ? color = Colors.grey : color = Colors.white;
      return color;
    }
    if (_row.isOdd) {
      index.isEven ? color = Colors.grey : color = Colors.white;
      return color;
    }
  }

  void updateIndex(int index) {
    if (_breakingPointList.where((element) => element == index).length > 0) {
      ++_row;
      _changeIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    _row = 0;
    _changeIndex = 0;
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio:
        ChessBoard.crossAxisCount / ChessBoard.crossAxisCount,
        crossAxisCount: ChessBoard.crossAxisCount,
      ),
      itemCount: ChessBoard.totalPiece,
      itemBuilder: (ctx, index) {
        updateIndex(index);
        return ChessPiece(
          mRow: _row,
          mColor: checkColor(index),
          mColumn: _changeIndex++,
        );
      },
    );
  }
}
