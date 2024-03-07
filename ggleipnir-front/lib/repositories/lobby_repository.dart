
import 'package:ggleipnir_front/models/lobby_model.dart';

class LobbyRepository {
  List<LobbyModel> _entries = [];

  addEntry(LobbyModel entry)  {
    _entries.add(entry);
  }

  addList(List<LobbyModel> entries)  {
    _entries = [..._entries, ...entries];
  }

  removeEntry(LobbyModel entry)  {
    _entries.remove(entry);
  }

  List<LobbyModel> allEntries() {
    return _entries;
  }
}