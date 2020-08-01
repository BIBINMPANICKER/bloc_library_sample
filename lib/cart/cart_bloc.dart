import 'package:bloc_library_sample/cart/cart_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CartEvent event) async* {
    if (event is Increment)
      yield state + 1;
    else if (event is Decrement) {
      if (state != 0) {
        yield state - 1;
      }
    }
    throw UnimplementedError();
  }
}
