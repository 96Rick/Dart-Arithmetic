class MyLinkedList {
  Node _head;
  Node _last;
  int _size = 0;
  MyLinkedList();

  void insert(int data, int index) {
    if (index < 0 || index > _size) {
      print("插入位置错误");
      return;
    }
    Node newNode = Node(data);
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

  static List<Node> getLists(Node fullList) {
    Node list1 = null;
    Node list2 = null;
    Node temp1 = null;
    Node temp2 = null;
    int count = 1;
    while (fullList != null) {
      if (count % 2 == 1) {
        if (temp1 != null) {
          temp1.nextNode = fullList;
          temp1 = temp1.nextNode;
        } else {
          temp1 = fullList;
          list1 = temp1;
        }
      } else {
        if (temp2 != null) {
          temp2.nextNode = fullList;
          temp2 = temp2.nextNode;
        } else {
          temp2 = fullList;
          list2 = temp2;
        }
      }
      fullList = fullList.nextNode;
      count++;
    }
    temp1.nextNode = null;
    temp2.nextNode = null;
    return [list1, list2];
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
  Node(int data) : this.data = data;
}

main(List<String> args) {
  MyLinkedList list = MyLinkedList();
  list.insert(1, 0);
  list.insert(8, 1);
  list.insert(3, 2);
  list.insert(6, 3);
  list.insert(5, 4);
  list.insert(4, 5);
  list.insert(7, 6);
  list.insert(2, 7);
  list.insert(9, 8);
  print(list._head);

  Node head = Node(0);
  head.nextNode = Node(1);
  head = head.nextNode;
  head.nextNode = Node(2);
  head = head.nextNode;

  head.nextNode = Node(3);
  head = head.nextNode;

  head.nextNode = Node(4);
  head = head.nextNode;
  while (head != null) {
    print(head.data);
    head = head.nextNode;
  }
  print(head);

  List<Node> lists = MyLinkedList.getLists(list._head);
  while (lists[0] != null) {
    print(lists[0].data);
    lists[0] = lists[0].nextNode;
  }
  while (lists[1] != null) {
    print(lists[1].data);
    lists[1] = lists[1].nextNode;
  }
}
