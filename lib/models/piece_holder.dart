enum PieceHolder{
  blankPiece,


// The pawn
// The pawn is the least powerful piece and is worth one point.
// If it is a pawn's first move, it can move forward one or two squares.
// If a pawn has already moved, then it can move forward just one square at a time.
// It attacks (or captures) each square diagonally to the left or right
  whitePiece,//1
  pawnWhite,
  bishopWhite,
  kingWhite,//4
  knightWhite,
  queenWhite,
  rookWhite,

  blackPiece,//8
  pawnBlack,
  bishopBlack,
  kingBlack,
  knightBlack,
  queenBlack,
  rookBlack,
}

class PieceHolderChecker{

  static PieceHolder getChessType(PieceHolder pieceHolder){
    if(pieceHolder == PieceHolder.blankPiece){
      return PieceHolder.blankPiece;
    }
    if(pieceHolder.index > 1 && pieceHolder.index < 8){
      return PieceHolder.whitePiece;
    }else{
      return PieceHolder.blackPiece;
    }
  }
}