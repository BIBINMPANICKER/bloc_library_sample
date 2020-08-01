abstract class CartState {
  int counterValue = 0;

  void increment() {
    counterValue++;
  }

  void decrement() {
    counterValue--;
  }
}

class CartIncrement extends CartState {
  CartIncrement() {
    increment();
  }

  @override
  String toString() {
    return 'CartCounterIncrement{}';
  }
}

class CartDecrement extends CartState {
  CartDecrement() {
    decrement();
  }

  @override
  String toString() {
    return 'CartCounterDecrement{}';
  }
}

class EmptyCart extends CartState {
  int cartCounter = 0;

  @override
  String toString() {
    return 'EmptyCart{}';
  }
}

class CartError extends CartState {
  @override
  String toString() {
    return 'CartError{}';
  }
}
