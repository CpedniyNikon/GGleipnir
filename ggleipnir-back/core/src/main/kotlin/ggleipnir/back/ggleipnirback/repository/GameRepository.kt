package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.model.GameCart
import ggleipnir.back.ggleipnirback.model.request.GameCartCreationRequest

interface GameRepository {
    fun addGame(gameCart: GameCartCreationRequest): GameCart

    fun deleteGame(id: String): Unit

    fun getGame(id: String): GameCart

    fun getGames(): List<GameCart>
}