import 'dart:ffi';

import 'stack.dart';

class DiscontinuousArray {
  List _array;
  int _itemCont = 0;
  int _lastIndex = 0;

  DiscontinuousArray(int size) {
    _array = List(size);
  }

  void resize() {
    List newArray = List(_array.length * 2);
    for (var i = 0; i < _array.length; i++) {
      newArray[i] = _array[i];
    }
    _array = newArray;
  }

  void insert(int index, dynamic element) {
    print("\n");

    if (index < 0) {
      print("插入位置不能为负数");
      return;
    }

    while (index >= _array.length || _itemCont >= _array.length) {
      print("执行resize");
      resize();
    }

    for (var i = 0; i < _array.length; i++) {
      if (_array[i] != null) {
        _lastIndex = i;
      }
    }
    print("数组最后一位非空值 index 为：" + _lastIndex.toString());

    for (var i = _lastIndex; i >= index; i--) {
      if (_array[index] != null) {
        _array[i + 1] = _array[i];
        print("执行换位， 把$i 位: " +
            _array[i].toString() +
            "  换到" +
            (i + 1).toString() +
            "位");
      }
    }
    print("执行插入， 在$index 位: 插入: " + element.toString());
    _array[index] = element;
    _itemCont++;
    print("当前数组为：" + _array.toString());
    print("当前总共元素个数：" + _itemCont.toString());
  }

  void delete(int index) {
    print("\n");
    if (index < 0 || index >= _array.length) {
      print("删除位置有误");
      return;
    }
    if (_array[index] != null) {
      _itemCont--;
    }
    _array[index] = null;
    print("执行删除 删除第$index 个元素, 当前总共元素个数是：" + _itemCont.toString());
  }

  void output() {
    print("\n");
    for (var i = 0; i < _array.length; i++) {
      print("第$i 个元素是" + _array[i].toString());
    }
  }
}

class ContinuousArray {
  List _array;
  int _itemCont = 0;

  ContinuousArray(int size) {
    _array = List(size);
  }

  void resize() {
    var newArray = List(_itemCont * 2);
    for (var i = 0; i < _itemCont; i++) {
      newArray[i] = _array[i];
    }
    _array = newArray;
  }

  void insert(int index, dynamic element) {
    if (index < 0 || index > _array.length) {
      print("插入位置有误");
      return;
    }
    if (_itemCont >= _array.length) {
      resize();
    }
    for (var i = _itemCont; i > index; i--) {
      _array[i] = _array[i - 1];
    }
    _array[index] = element;
    _itemCont++;
  }

  void delete(int index) {
    if (index < 0 || index >= _array.length) {
      print("删除位置有误");
      return;
    }
    for (var i = index; i < _itemCont - 1; i++) {
      _array[i] = _array[i + 1];
    }
    _array[_itemCont - 1] = null;
    _itemCont--;
  }

  void output() {
    for (var item in _array) {
      print(item);
    }
  }
}

void main() {
  /**
 *  给一个数组，定义X为某个区间的最小值乘上这个区间内所有元素的和，求最大的X。如数组为3 1 6 4 5，则最大的X=4*（6+4+5）=60
 *  解题总个数 2
 * 
 */

  FindMiddleInOverTurnArray findElement =
      FindMiddleInOverTurnArray([3, 4, 5, 6, 1, 2]);
  print(findElement.findMinddle());

  // var findArray = FindMaxTInArray([3, 1, 6, 4, 5]);
  // findArray.findArray();
}

class FindMaxTInArray {
  List _array;
  Stack<int> s;
  int sum;

  FindMaxTInArray(List array) {
    _array = array;
  }

/**
 * 方法1： 时间复杂度 O(n2) 
 * 
 */
  void findArray() {
    if (_array.length == 1) {
      print("X = " + (_array[0] * _array[0]).toString());
      return;
    }
    var maxSum = 0;
    for (var i = 0; i < _array.length; i++) {
      var sum = 0;
      var min = _array[i];
      for (var j = i; j < _array.length; j++) {
        if (_array[j] < min) min = _array[j];
        sum += _array[j];
        maxSum = maxSum < min * sum ? min * sum : maxSum;
      }
    }
    print("X = " + maxSum.toString());
  }

  /**
   * 方法2
   */
  void stackFindArray() {}
}

class FindMiddleInOverTurnArray {
  /**
   *  345 123
   *  sumcount = 7
   *  count1 = 4
   *  count2 = 3
   *  sumcount / 2 = 3.5
   * 
   */

  int _point;
  int get _sumCount => _array.length;
  List _array;
  FindMiddleInOverTurnArray(List<int> array) : _array = array;
  dynamic findMinddle() {
    for (var i = 1; i < _array.length; i++) {
      if (_array[i - 1] > _array[i]) {
        _point = i;
        break;
      }
    }
    if (_sumCount / 2 > _point) {
      if (_sumCount % 2 == 0)
        return (_array[_point - 2 + _sumCount ~/ 2] +
                _array[_point - 1 + _sumCount ~/ 2]) /
            2;
      else
        return _array[_point + _sumCount ~/ 2];
    } else if (_sumCount / 2 < _point) {
      if (_sumCount % 2 == 0)
        return (_array[_point - 1 - _sumCount ~/ 2] +
                _array[_point - _sumCount ~/ 2]) /
            2;
      else
        return _array[_point - 1 - _sumCount ~/ 2];
    } else
      return (_array[0] + _array[_sumCount - 1]) / 2;
  }
}
