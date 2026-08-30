import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:videocalling/core/constants/current_user.dart';
import 'package:videocalling/core/constants/zego_constants.dart';
import 'package:videocalling/main_screen/main_screen_controller.dart';
import 'package:videocalling/translation/remote_audio_service.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() =>
      _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  // IMPORTANT:
  // Use ONE RemoteAudioService instance.
  final RemoteAudioService remoteAudioService =
      RemoteAudioService.instance;

  @override
  void initState() {
    super.initState();

    _setupRemoteAudio();
  }

  Future<void> _setupRemoteAudio() async {
    try {
      remoteAudioService.onAudioReceived =
          (Uint8List pcmData) {
        debugPrint(
          '🔥 TRANSLATION PCM RECEIVED: '
          '${pcmData.length} bytes',
        );

        // Do NOT add STT yet.
        // First verify that this callback fires.
      };

      debugPrint(
        '🎤 Starting remote audio processing...',
      );

      await remoteAudioService.start();

      debugPrint(
        '✅ REMOTE AUDIO SERVICE STARTED',
      );
    } catch (e, stackTrace) {
      debugPrint(
        '❌ REMOTE AUDIO SERVICE ERROR: $e',
      );

      debugPrint(
        stackTrace.toString(),
      );
    }
  }

  @override
  void dispose() {
    // Only remove our callback.
    remoteAudioService.onAudioReceived = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppUser user =
        Get.arguments as AppUser;

    final String callId =
        'call_${user.id}';

    return ZegoUIKitPrebuiltCall(
      appID: ZegoConstants.appId,
      appSign: ZegoConstants.appSign,

      userID: CurrentUser.id,
      userName: CurrentUser.name,

      callID: callId,

      config:
          ZegoUIKitPrebuiltCallConfig
              .oneOnOneVideoCall(),
    );
  }
}