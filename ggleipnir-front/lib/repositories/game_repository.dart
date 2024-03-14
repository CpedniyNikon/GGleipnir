import 'package:ggleipnir_front/models/game_model.dart';

class GameRepository {
  List<GameModel> games;

  GameRepository(this.games);

  GameRepository.initial() : games = [];

  GameRepository copyWith({required List<GameModel> games}) {
    return GameRepository(games);
  }

  addEntry(GameModel entry)  {
    games.add(entry);
  }

  addList(List<GameModel> entries)  {
    games = [...games, ...entries];
  }

  removeEntry(GameModel entry)  {
    games.remove(entry);
  }

  List<GameModel> allEntries() {
    return games;
  }
}