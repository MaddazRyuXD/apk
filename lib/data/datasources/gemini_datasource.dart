import 'package:google_generative_ai/google_generative_ai.dart';
import '../../core/constants/env_config.dart';

class GeminiDatasource {
  final GenerativeModel _model;

  GeminiDatasource()
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: geminiApiKey,
        );

  Future<String> sendMessage(String prompt) async {
    if (geminiApiKey.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      return 'AI tidak tersedia. Tambahkan API key Gemini di env_config.dart untuk mengaktifkan respons nyata.';
    }

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Tidak ada respons dari AI';
    } catch (error) {
      return 'Terjadi kesalahan saat memanggil AI: $error';
    }
  }
}
