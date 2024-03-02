import 'package:ggleipnir_front/models/game_model.dart';

class GameRepository {
  List<GameModel> _entries = [];

  addEntry(GameModel entry)  {
    _entries.add(entry);
  }

  addList(List<GameModel> entries)  {
    _entries = [..._entries, ...entries];
  }

  removeEntry(GameModel entry)  {
    _entries.remove(entry);
  }

  List<GameModel> allEntries() {
    return _entries;
  }
}