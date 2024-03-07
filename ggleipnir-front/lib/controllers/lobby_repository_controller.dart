import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/repositories/lobby_repository.dart';

final lobbyRepositoryProvider = StateProvider<LobbyRepository>((ref) {
  return LobbyRepository();
});