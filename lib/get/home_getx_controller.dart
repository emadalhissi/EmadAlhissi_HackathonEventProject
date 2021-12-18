
import 'package:get/get.dart';

class HomeGetXController extends GetxController {
  // HomeResponse? homeResponse;
  // bool loading = false;
  // final HomeApiController _apiController = HomeApiController();

  @override
  void onInit() {
    // TODO: implement onInit
    getHome();
    super.onInit();
  }

  Future<void> getHome() async {
    // loading = true;
    // homeResponse = await _apiController.showHome();
    // loading = false;
    update();
  }
}
