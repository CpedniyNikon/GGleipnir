import 'package:ggleipnir_front/core/models/lobby_model.dart';

class LobbyRepository {
  List<LobbyModel> lobbies;

  LobbyRepository(this.lobbies);

  LobbyRepository.empty() : lobbies = [];

  LobbyRepository copyWith({required List<LobbyModel> games}) {
    return LobbyRepository(games);
  }

  addEntry(LobbyModel entry)  {
    lobbies.add(entry);
  }

  addList(List<LobbyModel> entries)  {
    lobbies = [...lobbies, ...entries];
  }

  removeEntry(LobbyModel entry)  {
    lobbies.remove(entry);
  }

  List<LobbyModel> allEntries() {
    return lobbies;
  }

}
