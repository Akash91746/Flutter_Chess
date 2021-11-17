import 'package:chess_flutter/models/piece_helper.dart';
import 'package:chess_flutter/models/piece_holder.dart';
import 'package:flutter/material.dart';

class CheckBoxPiece extends StatefulWidget {
  final List<PieceHolder> pieceList;

  const CheckBoxPiece(this.pieceList);

  @override
  _CheckBoxPieceState createState() => _CheckBoxPieceState();
}

class _CheckBoxPieceState extends State<CheckBoxPiece> {
  var _listOfCheckBoxResult = [
    true,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'SELECT PIECE',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                wordSpacing: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 9),
            child: ListView.builder(
              itemCount: widget.pieceList.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return CheckboxListTile(
                  value: _listOfCheckBoxResult[index],
                  onChanged: (val) {
                    setState(() {
                      for (int i = 0; i < _listOfCheckBoxResult.length; i++) {
                        _listOfCheckBoxResult[i] = false;
                      }
                      _listOfCheckBoxResult[index] = true;
                    });
                  },
                  secondary: Image(
                    image: AssetImage(
                        PieceHelper.getPiece(widget.pieceList[index])),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              var index = _listOfCheckBoxResult.indexWhere((element) => element == true);
              Navigator.of(context).pop(widget.pieceList[index]);
            },
            child: Text('DONE'),
          ),
        ],
      ),
    );
  }
}
