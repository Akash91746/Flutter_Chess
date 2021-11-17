class Node{

  List<Node> _childNode=[];
  var _key;
  var _data;

  void setKey(var key){
    this._key = key;
  }

  dynamic get key{
    return this._key;
  }

  void setData(var data){
    this._data = data;
  }

  dynamic get data{
    return this._data;
  }

  void addNodeToChild(Node node){
    _childNode.add(node);
  }

  List<Node> get childNode{
    return this._childNode;
  }

}