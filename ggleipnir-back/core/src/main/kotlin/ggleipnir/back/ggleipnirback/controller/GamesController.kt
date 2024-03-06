package ggleipnir.back.ggleipnirback.controller

import ggleipnir.back.ggleipnirback.model.Category
import ggleipnir.back.ggleipnirback.model.GameCart
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.lang.Integer.min

@RestController
class GamesController {
    @GetMapping("/v1/games")
    fun getAllGamesCarts(
        @RequestParam("limit", required = false, defaultValue="4") limit: Int,
        @RequestParam("offset", required = false, defaultValue = "0") offset: Int
    ): List<GameCart> {
        val gameCarts: List<GameCart> = listOf(
            GameCart("dota 2", "url", 100, listOf(Category.MOBA, Category.MULTIPLAYER)),
            GameCart("counter-strike 1.6", "url", 10, listOf(Category.SHOOTER, Category.MULTIPLAYER)),
            GameCart("counter-strike 2", "url", 10, listOf(Category.SHOOTER, Category.MULTIPLAYER)),
            GameCart("world of warcraft", "url", 10, listOf(Category.MOBA, Category.RPG, Category.MULTIPLAYER)),
            GameCart("path of exile", "url", 10, listOf(Category.MULTIPLAYER, Category.MOBA)),
            GameCart("sirus", "url", 10, listOf(Category.MULTIPLAYER, Category.MOBA))
        )
        if (offset > gameCarts.size) {
            return listOf()
        }
        val updatedLimit = min(gameCarts.size, offset + limit)
        return gameCarts.subList(offset, offset + updatedLimit)
    }
}