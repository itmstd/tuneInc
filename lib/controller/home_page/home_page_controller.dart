import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {

  late SharedPreferences prefs;
  RxBool isPremium = false.obs;
  RxInt genreSelection = 1.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    isPremium.value = prefs.getBool('premiumUser') ?? false;
    print(isPremium.value);
  }
}