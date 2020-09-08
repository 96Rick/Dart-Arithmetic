class MyLinkedList {
  Node _head;
  Node _last;
  int _size;
  MyLinkedList(int size) : _size = size;

  void insert(int data, int index) {
    if (index < 0 || index > _size) {
      print("插入位置错误");
      return;
    }
    Node newNode = Node(data: data);
    if (_size == 0) {
      _head = newNode;
      _last = newNode;
    } else if (index == 0) {
      newNode.nextNode = _head;
      _head = newNode;
    } else if (index == _size) {
      _last.nextNode = newNode;
      _last = newNode;
    } else {
      Node previousNode = get(index);
      newNode.nextNode = previousNode.nextNode;
      previousNode.nextNode = newNode;
    }
    _size++;
  }

  Node get(int index) {
    if (index < 0 || index >= _size) {
      print("插入位置错误");
      return null;
      // throw FormatException("插入位置错误");
    }
    Node temp = _head;
    for (var i = 0; i < index; i++) {
      temp = temp.nextNode;
    }
    return temp;
  }

  Node remove(index) {
    if (index < 0 || index >= _size) {
      print("插入位置错误");
      return null;
      // throw FormatException("插入位置错误");
    }
    Node deleteNode = null;
    if (index == 0) {
      deleteNode = _head;
      _head = _head.nextNode;
    } else if (index == _size - 1) {
      deleteNode = _last;
      Node previousNode = get(index - 1);
      previousNode.nextNode = null;
      _last = previousNode;
    } else {
      Node previousNode = get(index - 1);
      Node nextNode = previousNode.nextNode.nextNode;
      deleteNode = previousNode.nextNode;
      previousNode.nextNode = nextNode;
    }
    _size--;
    return deleteNode;
  }

  void output() {
    Node temp = _head;
    while (temp != null) {
      print(temp.data);
      temp = temp.nextNode;
    }
  }
}

class Node {
  Node nextNode;
  int data;
  Node({this.data});
}
