import '../home/home.dart';
import 'object_factory.dart';

class RestaurantApiProvider {
  //fetch restaurant's details and bifurcate based on status code
  Future<RestaurantModel> getRestaurantDetails() async {
    final response = await ObjectFactory().apiClient.getRestaurantDetails();

    if (response.statusCode == 200) {
      return RestaurantModel.fromMap(response.data[0]);
    } else {
      return null;
    }
  }
}
