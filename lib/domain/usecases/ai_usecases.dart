import '../../data/repositories/ai_repository.dart';

class AIUseCases {
  final AIRepository repository;
  AIUseCases(this.repository);
  Future<String> sendPrompt(String prompt) => repository.sendPrompt(prompt);
}
