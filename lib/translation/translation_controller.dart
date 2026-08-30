import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:videocalling/translation/translation_service.dart';

class CallTranslationController extends GetxController {
  final FlutterTts tts = FlutterTts();

  final RealtimeTranslationService service =
      RealtimeTranslationService();

  final isEnabled = false.obs;

  final targetLanguage = 'mr'.obs;

  final translatedText = ''.obs;

  void toggleTranslation() {
    isEnabled.value = !isEnabled.value;

    if (!isEnabled.value) {
      stopSpeaking();
    }
  }

  void changeLanguage(String language) {
    targetLanguage.value = language;
  }

  Future<void> processRecognizedText(String text) async {
    if (!isEnabled.value || text.trim().isEmpty) {
      return;
    }

    final translated = await service.translate(
      text: text,
      targetLanguage: targetLanguage.value,
    );

    translatedText.value = translated;

    await speak(translated);
  }

  Future<void> speak(String text) async {
    if (text.isEmpty) return;

    final language = targetLanguage.value == 'mr'
        ? 'mr-IN'
        : 'gu-IN';

    await tts.stop();

    await tts.setLanguage(language);
    await tts.setSpeechRate(0.45);

    await tts.speak(text);
  }

  Future<void> stopSpeaking() async {
    await tts.stop();
  }

  @override
  void onClose() {
    tts.stop();
    super.onClose();
  }
}