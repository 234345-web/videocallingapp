import 'package:get/get.dart';
import 'package:videocalling/main_screen/main_screen_controller.dart';
import 'package:videocalling/main_screen/main_screen_view.dart';
import 'package:videocalling/translation/translation_controller.dart';
import 'package:videocalling/translation/translation_screen.dart';
import 'package:videocalling/video_call/video_call_controller.dart';
import 'package:videocalling/video_call/video_call_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MainScreenController>(
          () => MainScreenController(),
        );
      }), 
    ),
    GetPage(
      name: AppRoutes.videoCall,
      page: () => const VideoCallScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<VideoCallController>(
          () => VideoCallController(),
        );
      }), 
    ),
    
  ];
}