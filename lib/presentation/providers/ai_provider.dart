
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/gemini_datasource.dart';
import '../../data/models/ai_message_model.dart';

final aiProvider = StateNotifierProvider<AIChatNotifier, List<AIMessageModel>>(
  (ref) => AIChatNotifier(GeminiDatasource()),
);

class AIChatNotifier extends StateNotifier<List<AIMessageModel>> {
  final GeminiDatasource _datasource;

  AIChatNotifier(this._datasource)
      : super([
          const AIMessageModel(id: '1', text: 'Halo! Saya siap membantu produktivitasmu.', isUser: false),
        ]);

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    state = [
      ...state,
      AIMessageModel(id: DateTime.now().millisecondsSinceEpoch.toString(), text: text, isUser: true),
      const AIMessageModel(id: 'ai-loading', text: 'Sedang memproses...', isUser: false),
    ];

    final responseText = await _datasource.sendMessage(text);
    state = [
      ...state.where((message) => message.id != 'ai-loading'),
      AIMessageModel(id: '${DateTime.now().millisecondsSinceEpoch}-ai', text: responseText, isUser: false),
    ];
  }
}
