// Time: O(n2)
// Spave: O(n2)
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
