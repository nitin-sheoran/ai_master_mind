import 'dart:convert';
import 'dart:developer';
import 'package:ai_master_mind/ai/helper/global.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      log('api key: $apiKey');

      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );

      final content = [Content.text(question)];
      final res = await model.generateContent(content, safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      ]);

      log('res: ${res.text}');

      return res.text!;
    } catch (e) {
      log('getAnswerGeminiE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }

  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
      await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(res.body);

      //
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }

  static Future<String> googleTranslate(
      {required String from, required String to, required String text}) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);

      return res.text;
    } catch (e) {
      log('googleTranslateE: $e ');
      return 'Something went wrong!';
    }
  }
}