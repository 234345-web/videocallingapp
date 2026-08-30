import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'remote_audio_service.dart';

class CallTranslationController extends GetxController {
  final RemoteAudioService remoteAudioService =
      RemoteAudioService.instance;

  final isTranslating = false.obs;

  Future<void> startRemoteAudio() async {
    if (isTranslating.value) {
      debugPrint('TRANSLATION ALREADY RUNNING');
      return;
    }

    try {
      // Register listener BEFORE starting ZEGO processing.
      remoteAudioService.onAudioReceived =
          (Uint8List pcmData) {
        debugPrint(
          'TRANSLATION RECEIVED PCM: '
          '${pcmData.length} bytes',
        );

        // NEXT STEP:
        // Send pcmData to Speech-to-Text backend.
      };

      await remoteAudioService.start();

      isTranslating.value = true;

      debugPrint(
        'CALL TRANSLATION STARTED',
      );
    } catch (e, stackTrace) {
      debugPrint(
        'CALL TRANSLATION START ERROR: $e',
      );

      debugPrint(
        stackTrace.toString(),
      );
    }
  }

  Future<void> stopRemoteAudio() async {
    remoteAudioService.onAudioReceived = null;

    await remoteAudioService.stop();

    isTranslating.value = false;

    debugPrint(
      'CALL TRANSLATION STOPPED',
    );
  }

  @override
  void onClose() {
    remoteAudioService.onAudioReceived = null;

    remoteAudioService.stop();

    super.onClose();
  }
}