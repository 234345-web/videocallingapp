
/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocalling/translation/translation_controller.dart';

class TranslationScreen extends GetView<CallTranslationController> {
  const TranslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Translation'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Translation ON / OFF
            Obx(
              () => SwitchListTile(
                title: const Text(
                  'Voice Translation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  controller.isTranslationEnabled.value
                      ? 'Translation is ON'
                      : 'Translation is OFF',
                ),
                value: controller.isTranslationEnabled.value,
                onChanged: (_) {
                  controller.toggleTranslation();
                },
              ),
            ),

            const SizedBox(height: 25),

            // Target language
            Obx(
              () => DropdownButtonFormField<String>(
                initialValue: controller.targetLanguage.value,

                decoration: const InputDecoration(
                  labelText: 'Translate to',
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(
                    value: 'mr',
                    child: Text('Marathi'),
                  ),
                  DropdownMenuItem(
                    value: 'gu',
                    child: Text('Gujarati'),
                  ),
                ],

                onChanged: (value) {
                  if (value != null) {
                    controller.setLanguage(value);
                    controller.translatedText.value = '';
                  }
                },
              ),
            ),

            const SizedBox(height: 30),

            // Translation result
            Obx(
              () => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Translated Speech',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      controller.translatedText.value.isEmpty
                          ? 'Translation will appear here...'
                          : controller.translatedText.value,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Translation status
            Obx(
              () => Icon(
                controller.isTranslationEnabled.value
                    ? Icons.translate
                    : Icons.translate_outlined,
                size: 60,
                color: controller.isTranslationEnabled.value
                    ? Colors.green
                    : Colors.grey,
              ),
            ),

            const SizedBox(height: 15),

            Obx(
              () => Text(
                controller.isTranslationEnabled.value
                    ? 'Voice translation enabled'
                    : 'Voice translation disabled',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Stop translated voice
            ElevatedButton.icon(
              onPressed: controller.stopSpeaking,
              icon: const Icon(Icons.stop),
              label: const Text('Stop Translation Voice'),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
*/
