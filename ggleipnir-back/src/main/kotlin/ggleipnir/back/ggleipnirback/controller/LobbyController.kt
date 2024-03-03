package ggleipnir.back.ggleipnirback.controller

import ggleipnir.back.ggleipnirback.model.Category
import ggleipnir.back.ggleipnirback.model.GameCart
import ggleipnir.back.ggleipnirback.model.Lobby
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class LobbyController {
    private val gameMap: Map<String, List<Lobby>> = mapOf(
        "dota 2" to listOf(Lobby("lobby1", 1, 1, 100, false), Lobby("lobby2", 2, 2, 100, true)),
        "counter-strike 1.6" to listOf(Lobby("lobby1", 1, 1, 100, false), Lobby("lobby2", 2, 2, 100, true)),
        "counter-strike 2" to listOf(Lobby("lobby1", 1, 1, 100, false), Lobby("lobby2", 2, 2, 100, true)),
        "world of warcraft" to listOf(Lobby("lobby1", 1, 1, 100, false), Lobby("lobby2", 2, 2, 100, true)),
        "path of exile" to listOf(Lobby("lobby1", 1, 1, 100, false), Lobby("lobby2", 2, 2, 100, true)),
        "sirus" to listOf(Lobby("lobby1", 1, 1, 100, false), Lobby("lobby2", 2, 2, 100, true)),
    )
    @GetMapping("/v1/games/{gameName}/lobbies")
    fun getAllGamesCarts(
        @PathVariable("gameName") gameName: String,
        @RequestParam("limit", required = false, defaultValue="4") limit: Int,
        @RequestParam("offset", required = false, defaultValue = "0") offset: Int
    ): List<Lobby> {
        val lobbies: List<Lobby>? = gameMap.getOrDefault(gameName, null);
        if (offset > lobbies?.size ?: 0) {
            return listOf()
        }
        val updatedLimit = Integer.min(lobbies?.size ?: 0, offset + limit)
        return lobbies?.subList(offset, offset + updatedLimit) ?: listOf()
    }
}