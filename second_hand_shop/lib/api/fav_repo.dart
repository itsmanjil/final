import 'package:get/get.dart';
import 'package:second_hand_shop/api/fav_api.dart';

class FavController extends GetxController {
  final Faveriots _faveriots = Faveriots();
  RxBool loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;

  loadProductsFromRepo(String productid, String userid) async {
    loading(true);
    products = await _faveriots.addFav(productid, userid);
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}
