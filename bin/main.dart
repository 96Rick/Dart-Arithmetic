import '../lib/array.dart';

void main() {
  // 数组插入删除
  var array = DiscontinuousArray(4);
  array.insert(0, 1);
  array.insert(1, 2);
  array.insert(2, 3);
  array.insert(3, 4);
  array.insert(5, 0);
  array.insert(4, 5);
  array.insert(2, 10);
  array.delete(0);
  array.output();
}
