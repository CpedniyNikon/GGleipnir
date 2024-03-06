import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';

final gameRepositoryProvider = StateProvider<GameRepository>((ref) {
  return GameRepository();
});