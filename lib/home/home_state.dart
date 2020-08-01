import 'home.dart';

abstract class HomeState {}

class HomeLoaded extends HomeState {
  final RestaurantModel restaurantModel;

  HomeLoaded({this.restaurantModel});

  @override
  String toString() => 'HomeLoaded';
}

class HomeUninitialized extends HomeState {
  @override
  String toString() => 'HomeUninitialized';
}

class HomeError extends HomeState {
  @override
  String toString() => 'HomeError';
}
