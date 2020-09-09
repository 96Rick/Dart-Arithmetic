main() {
  Stack aStack = Stack(10);
  // aStack.pop();
  aStack.push(1);
  aStack.push("e");
  aStack.push("lalala");
  aStack.push(true);
  aStack.push(1);
  print(aStack.pop());
  print(aStack.pop());
  aStack.push(2);
  print(aStack.pop());
  aStack.toString();
}

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

  @override
  String toString() {
    print(_stack.toString());
  }

  E pop() {
    if (isEmpty) throw StackEmptyExcption();
    var res = _stack[_top];
    _stack[_top--] = null;
    return res;
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
