package ggleipnir.back.ggleipnirback.service

import ggleipnir.back.ggleipnirback.model.GameCart
import ggleipnir.back.ggleipnirback.model.request.GameCartCreationRequest
import ggleipnir.back.ggleipnirback.repository.GameRepository
import org.springframework.stereotype.Service

@Service
class GameService(
    val gameRepository: GameRepository
) {
    fun getGame(id: String): GameCart {
        return gameRepository.getGame(id)
    }

    fun getGames(): List<GameCart> {
        return gameRepository.getGames()
    }

    fun addGame(gameCart: GameCartCreationRequest): GameCart {
        return gameRepository.addGame(gameCart)
    }

    fun deleteGame(id: String) {
        gameRepository.deleteGame(id)
    }
}