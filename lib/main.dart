import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:videocalling/core/constants/current_user.dart';
import 'package:videocalling/core/constants/zego_constants.dart';
import 'package:videocalling/routes/app_pages.dart';
import 'package:videocalling/routes/app_routes.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ZegoUIKitPrebuiltCallInvitationService()
      .setNavigatorKey(navigatorKey);

  await ZegoUIKitPrebuiltCallInvitationService().init(
    appID: ZegoConstants.appId,
    appSign: ZegoConstants.appSign,
    userID: CurrentUser.id,
    userName: CurrentUser.name,
    plugins: [
      ZegoUIKitSignalingPlugin(),
    ],
  );

  runApp(
    GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.mainScreen,
      getPages: AppPages.routes,
    ),
  );
}