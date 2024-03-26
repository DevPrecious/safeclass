import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nsafeclass/constants/constants.dart';

class ParentController extends GetxController {
  final isLoading = false.obs;

  @override
  void onInit() {
    getParent();
    super.onInit();
  }

  Future getParent() async {
    try {
      isLoading.value = true;
      http.Response response = await http.get(
        Uri.parse('https://mobile-api-teal.vercel.app/api/parent/get'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      print(response.body);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
