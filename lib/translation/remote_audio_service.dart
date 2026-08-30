import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class RemoteAudioService {
  RemoteAudioService._();

  static final RemoteAudioService instance =
      RemoteAudioService._();

  bool _isEnabled = false;

  Function(Uint8List data)? onAudioReceived;

  Future<void> start() async {
    if (_isEnabled) {
      debugPrint('REMOTE AUDIO: ALREADY ENABLED');
      return;
    }

    final engine = ZegoExpressEngine.instance;

    debugPrint('REMOTE AUDIO: REGISTERING CALLBACK');

    ZegoExpressEngine.onProcessRemoteAudioData = (
      Uint8List data,
      int dataLength,
      ZegoAudioFrameParam param,
      String streamID,
      double timestamp,
    ) {
      final length =
          dataLength.clamp(0, data.length);

      final pcmData =
          Uint8List.fromList(data.sublist(0, length));

      debugPrint(
        'REMOTE AUDIO RECEIVED -> '
        'stream=$streamID '
        'bytes=${pcmData.length} '
        'sampleRate=${param.sampleRate}',
      );

      final callback = onAudioReceived;

      if (callback != null) {
        callback(pcmData);
      } else {
        debugPrint(
          'REMOTE AUDIO WARNING: callback is NULL',
        );
      }
    };

    final config = ZegoCustomAudioProcessConfig(
      ZegoAudioSampleRate.SampleRate16K,
      ZegoAudioChannel.Mono,
      320,
    );

    debugPrint(
      'REMOTE AUDIO: ENABLING PROCESSING',
    );

    await engine.enableCustomAudioRemoteProcessing(
      true,
      config,
    );

    _isEnabled = true;

    debugPrint(
      'REMOTE AUDIO: PROCESSING ENABLED',
    );
  }

  Future<void> stop() async {
    if (!_isEnabled) {
      return;
    }

    debugPrint(
      'REMOTE AUDIO: STOPPING',
    );

    final engine = ZegoExpressEngine.instance;

    await engine.enableCustomAudioRemoteProcessing(
      false,
      ZegoCustomAudioProcessConfig(
        ZegoAudioSampleRate.SampleRate16K,
        ZegoAudioChannel.Mono,
        320,
      ),
    );

    ZegoExpressEngine.onProcessRemoteAudioData = null;

    onAudioReceived = null;

    _isEnabled = false;

    debugPrint(
      'REMOTE AUDIO: STOPPED',
    );
  }
}