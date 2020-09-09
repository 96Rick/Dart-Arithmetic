import '../lib/LinkedList.dart';

import '../lib/array.dart';

void main() {
  // 数组插入删除
  // var array = DiscontinuousArray(4);
  // array.insert(0, 1);
  // array.insert(1, 2);
  // array.insert(2, 3);
  // array.insert(3, 4);
  // array.insert(5, 0);
  // array.insert(4, 5);
  // array.insert(2, 10);
  // array.delete(0);
  // array.output();

  // ignore: omit_local_variable_types
  MyLinkedList link = MyLinkedList();
  link.insert(0, 0);
  link.insert(1, 1);
  link.insert(2, 2);
  link.insert(3, 3);
  link.insert(4, 4);
  link.insert(5, 5);
  link.insert(6, 6);
  link.insert(10, 1);
  link.output();
}
