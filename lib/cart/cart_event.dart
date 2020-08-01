abstract class CartEvent {}

class Increment extends CartEvent {
  @override
  String toString() {
    return 'CartIconIncrement{}';
  }
}

class Decrement extends CartEvent {
  @override
  String toString() {
    return 'CartCounterDecrement{}';
  }
}
class Initialize extends CartEvent{

  @override
  String toString() {
    return 'Initialize{}';
  }
}
