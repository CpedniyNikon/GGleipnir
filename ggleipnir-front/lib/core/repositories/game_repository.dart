import 'package:ggleipnir_front/core/models/game_model.dart';

enum GameType {
  online,
  followed,
}

class GameRepository {
  List<GameModel> gamesOnline;
  List<GameModel> followedGames;

  GameRepository(this.gamesOnline, this.followedGames);

  GameRepository.empty() : gamesOnline = [], followedGames = [];

  GameRepository copyWith({required List<GameModel> gamesOnline, required List<GameModel> followedGames}) {
    return GameRepository(gamesOnline, followedGames);
  }

  addEntry(GameModel entry, GameType gameType)  {
    if(gameType == GameType.online) {
      gamesOnline.add(entry);
    }
    if(gameType == GameType.followed) {
      followedGames.add(entry);
    }
  }

  addList(List<GameModel> entries, GameType gameType)  {
    if(gameType == GameType.online) {
      gamesOnline = [...gamesOnline, ...entries];
    }
    if(gameType == GameType.followed) {
      followedGames = [...followedGames, ...entries];
    }
  }

  removeEntry(GameModel entry, GameType gameType)  {
    if(gameType == GameType.online) {
      gamesOnline.remove(entry);
    }
    if(gameType == GameType.followed) {
      followedGames.remove(entry);
    }
  }

  List<GameModel> allEntries(GameType gameType) {
    if(gameType == GameType.online) {
      return gamesOnline;
    }
    if(gameType == GameType.followed) {
      return followedGames;
    }
    return [];
  }
}