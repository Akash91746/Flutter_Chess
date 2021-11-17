import 'piece_holder.dart';

class ChessTile {
  final _mUniqueId; //tile id
  PieceHolder _mChessPiece; // piece that is hold by tile
  var _mGlow;

  ChessTile(this._mUniqueId, this._mChessPiece,this._mGlow);

  void setGlowPiece(var glow){
    this._mGlow =  glow;
  }

  void setChessPiece(PieceHolder piece) {
    this._mChessPiece = piece;
  }

  PieceHolder get chessPiece {
    return this._mChessPiece;
  }

  bool get glow{
    return this._mGlow;
  }

  dynamic get uniqueId{
    return this._mUniqueId;
  }
}