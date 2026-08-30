
import 'package:get/get.dart';
import 'package:videocalling/main_screen/main_screen_controller.dart';

class VideoCallController extends GetxController {
  late AppUser user;

  final isMuted = false.obs;
  final isCameraOff = false.obs;
  final isCalling = true.obs;

  @override
  void onInit() {
    super.onInit();

    user = Get.arguments as AppUser;
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
  }

  void toggleCamera() {
    isCameraOff.value = !isCameraOff.value;
  }

  void endCall() {
    isCalling.value = false;
    Get.back();
  }
}
