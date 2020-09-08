class Stack<E> {
  List<E> _stack;
  int _capactiy;
  int _top;
  Stack(int cap)
      : _capactiy = cap,
        _stack = List<E>(cap),
        _top = -1;

  bool get isEmpty => _top == -1;
  bool get isFull => _top == _capactiy - 1;
  int get size => _top + 1;

  E pop() {
    if (isEmpty) throw StackEmptyExcption();
    return _stack[_top--];
  }

  void push(E e) {
    if (isFull) throw StackOverFlowException();
    _stack[++_top] = e;
  }

  E get topElement {
    if (isEmpty) return null;
    return _stack[_top];
  }
}

class StackOverFlowException implements Exception {
  const StackOverFlowException();
  String toString() => "StackOverFlowException";
}

class StackEmptyExcption implements Exception {
  const StackEmptyExcption();
  String toString() => "StackEmptyExcption";
}
