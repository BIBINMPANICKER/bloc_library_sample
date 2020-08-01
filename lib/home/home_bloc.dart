import 'dart:async';

import 'package:bloc_library_sample/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/object_factory.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoading)
      yield HomeUninitialized();
    else if (event is Fetch) {
      final response = await getRestaurantDetails();
      if (response != null)
        yield HomeLoaded(restaurantModel: response);
      else
        yield HomeError();
    }
    throw UnimplementedError();
  }

  getRestaurantDetails() async {
    print('Api call');
    final restaurantResponse =
        await ObjectFactory().repository.getRestaurantDetails();
    return restaurantResponse;
  }

  @override
  HomeState get initialState => HomeUninitialized();

  HomeBloc() {
    Future.delayed(const Duration(seconds: 4), () {
      print("print from blocPage");
      this.add(Fetch());
    });
  }
}
