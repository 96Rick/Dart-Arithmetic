// Time: O(n2)
// Spave: O(n2)
import 'dart:math';

void main() {
  // // 选择排序SelectSort
  // var sortDemo = SelectSort([3, 4, 2, 1, 5]);
  // print(sortDemo.startSort());
  Sort sort = Sort();
  List<int> arr = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];
  // print(sort.partition(arr, 4, 9, 5));
  QuickSort quickSort = QuickSort();
  print(quickSort.quickSort(arr, 0, arr.length - 1));
}

class Sort {
  Sort();
  /**
   * 
   * 再选中区域将数组分为左侧区域 为 小于target的区域， 右侧则为大于target的区域，中间是target 
   *       例： 【9，7，2，4，6，4，6，1】 target = 4 l=0 r - arr.length - 1
   *       res: 【1，2，4，4，6，6，7，9】
   */

  List partition(List arr, int l, int r, int target) {
    int less = l - 1;
    int more = r + 1;
    int cur = l;
    while (cur < more) {
      if (arr[cur] < target) {
        swap(arr, ++less, cur++);
      } else if (arr[cur] > target) {
        swap(arr, --more, cur);
      } else {
        cur++;
      }
    }
    print(arr);
    return [++less, --more];
  }

  void swap(List arr, int i, int j) {
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

class SelectSort {
  List _array;
  SelectSort(List array) {
    _array = array;
  }

  List startSort() {
    if (_array.length == 1) {
      return _array;
    }

    for (var i = 0; i < _array.length; i++) {
      var min = _array[i];
      for (var j = i + 1; j < _array.length; j++) {
        if (_array[j] < min) {
          _array[i] = _array[j];
          _array[j] = min;
          min = _array[i];
        }
      }
    }
    return _array;
  }
}

class QuickSort {
  QuickSort();

  // void quickSort(List<int> arr, int l, int r) {
  //   if (l < r) {
  //     List<int> p = partition(arr, l, r);
  //     quickSort(arr, l, p[0] - 1);
  //     quickSort(arr, p[1] + 1, r);
  //   }
  //   print(arr);
  // }

  // List<int> partition(List<int> arr, int l, int r) {
  //   int less = l - 1;
  //   int more = r;
  //   while (l < more) {
  //     if (arr[l] < arr[r]) {
  //       swap(arr, ++less, l++);
  //     } else if (arr[l] > arr[r]) {
  //       swap(arr, --more, l);
  //     } else {
  //       l++;
  //     }
  //   }
  //   swap(arr, more, r);
  //   return [less + 1, more];
  // }

  // void swap(List<int> arr, int i, int j) {
  //   int tamp = arr[i];
  //   arr[i] = arr[j];
  //   arr[j] = tamp;
  // }

  List<int> quickSort(List<int> arr, int l, int r) {
    if (l < r) {
      swap(arr, l + (Random().nextInt(r - l + 1)).toInt(), r);
      List<int> p = partition(arr, l, r);
      quickSort(arr, l, p[0] - 1);
      quickSort(arr, p[1] + 1, r);
    }

    return arr;
  }

  List<int> partition(List<int> arr, int l, int r) {
    // print("partition: -----------------");
    // print("l = " + l.toString());
    // print("r = " + r.toString());
    int less = l - 1;
    int more = r;
    // print("less = " + less.toString());
    // print("more = " + more.toString());
    var c = 0;
    while (l < more) {
      c++;
      print("while ----------------------" + "the " + c.toString() + " times");
      // print(" l = " + l.toString());
      // print(" more = " + more.toString());
      // print(" less = " + less.toString());
      if (arr[l] < arr[r]) {
        // print("arr[" + l.toString() + "] < arr[" + r.toString() + "]");
        swap(arr, ++less, l++);
      } else if (arr[l] > arr[r]) {
        // print("arr[" + l.toString() + "] > arr[" + r.toString() + "]");
        swap(arr, --more, l);
      } else {
        // print("arr[" + l.toString() + "] = arr[" + r.toString() + "]");
        l++;
      }
    }
    swap(arr, more, r);
    return [less + 1, more];
  }

  void swap(List<int> arr, int i, int j) {
    // print("swag the arr[" + i.toString() + "] and arr[" + j.toString() + "]");
    var temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  void heapSort(List arr, ) {
    if (arr == null || arr.length == 1) {
      return;
    }
    for (var i = 0; i < arr.length; i++) {
      heapInsert(arr, i);
    }

  }

  void heapInsert(List arr, int index) {
    while (arr[index] > arr[(index - 1) ~/ 2]) {
      swap(arr, index, (index - 1) ~/ 2);
      index = (index - 1) ~/ 2;
    }
  }

  void heapify(List arr, int)
}
