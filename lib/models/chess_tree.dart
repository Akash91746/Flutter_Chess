import 'package:chess_flutter/models/piece_holder.dart';
import 'chessTracker/node_tree.dart';

class NodeData {
  static Node parentNode = Node();
  Node whiteNodeChild = Node();
  Node blackNodeChild = Node();
  Node whitePawn = Node();
  Node blackPawn = Node();

  NodeData._privateConstructor();

  static final NodeData _instance = NodeData._privateConstructor();

  static NodeData get instance => _instance;

  void init() {
    parentNode.setKey(PieceHolder.blankPiece);

    whiteNodeChild.setKey(PieceHolder.whitePiece);

    whitePawn.setKey(PieceHolder.pawnWhite);
    whiteNodeChild.addNodeToChild(whitePawn);

    blackNodeChild.setKey(PieceHolder.blackPiece);

    blackPawn.setKey(PieceHolder.pawnBlack);
    blackNodeChild.addNodeToChild(blackPawn);

    parentNode.addNodeToChild(whiteNodeChild);
    parentNode.addNodeToChild(blackNodeChild);

    printInOrder(parentNode);
  }

  void printInOrder(Node parentNode) {
    print(parentNode.key);
    for (int i = 0; i < parentNode.childNode.length; i++) {
      printInOrder(parentNode.childNode[i]);
    }
  }

  Node addNode(var key, var data) {
    Node node = Node();
    node.setKey(key);
    node.setData(data);
    return node;
  }
}
