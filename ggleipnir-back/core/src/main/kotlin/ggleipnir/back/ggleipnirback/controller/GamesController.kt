package ggleipnir.back.ggleipnirback.controller

import ggleipnir.back.ggleipnirback.model.GameCart
import ggleipnir.back.ggleipnirback.model.request.GameCartCreationRequest
import ggleipnir.back.ggleipnirback.service.GameService
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class GamesController(
    val gameService: GameService
) {

    @GetMapping("/v1/games")
    fun getAllGamesCarts(): List<GameCart> {
        return gameService.getGames()
    }

    @GetMapping("/v1/game")
    fun getGameById(
        @RequestParam id: String
    ): GameCart {
        return gameService.getGame(id)
    }

    @PostMapping("/v1/game")
    fun addGame(
        @RequestBody request: GameCartCreationRequest
    ): GameCart {
        return gameService.addGame(request)
    }

    @DeleteMapping("/v1/game")
    fun deleteGame(
        @RequestParam id: String
    ) {
        gameService.deleteGame(id)
    }
}