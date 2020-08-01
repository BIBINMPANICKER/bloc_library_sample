import 'package:bloc_library_sample/home/home.dart';
import 'package:bloc_library_sample/utils/restaurant_api_provider.dart';

class Repository {
  final restaurantApiProvider = RestaurantApiProvider();

  Future<RestaurantModel> getRestaurantDetails() =>
      restaurantApiProvider.getRestaurantDetails();
}
