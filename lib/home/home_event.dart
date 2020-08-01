abstract class HomeEvent {}

class Fetch extends HomeEvent {
  @override
  String toString() => 'Fetch';
}

class HomeLoading extends HomeEvent{

  @override
  String toString() {
    return 'HomeLoading';
  }
}