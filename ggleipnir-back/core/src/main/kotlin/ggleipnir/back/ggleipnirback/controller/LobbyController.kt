package ggleipnir.back.ggleipnirback.controller

import ggleipnir.back.ggleipnirback.model.Lobby
import ggleipnir.back.ggleipnirback.model.request.LobbyCreationRequest
import ggleipnir.back.ggleipnirback.repository.model.LobbyDao
import ggleipnir.back.ggleipnirback.service.LobbyService
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@CrossOrigin
@RestController
class LobbyController(
    val lobbyService: LobbyService
) {
    @GetMapping("/v1/lobbies")
    fun getLobbies(): List<Lobby> {
        return lobbyService.getLobbies()
    }

    @GetMapping("/v1/lobby")
    fun getLobbiesByGameId(
        @RequestParam gameId: String
    ): List<Lobby> {
        return lobbyService.getLobbiesByGame(gameId)
    }

    @GetMapping("/v1/lobby/lobby")
    fun getLobbyByLobbyId(
        @RequestParam lobbyId: String
    ): LobbyDao {
        return lobbyService.getLobbyByLobbyId(lobbyId)
    }

    @PostMapping("/v1/lobby")
    fun addLobby(
        @RequestBody lobby: LobbyCreationRequest
    ) {
        lobbyService.addLobby(lobby)
    }

    @PostMapping("/v1/lobby/user")
    fun addUserToLobby(
        @RequestParam userId: String,
        @RequestParam lobbyId: String
    ) {
        lobbyService.addUserToLobby(userId, lobbyId)
    }

    @DeleteMapping("/v1/lobby/user")
    fun deleteUserFromLobby(
        @RequestParam userId: String,
        @RequestParam lobbyId: String
    ) {
        lobbyService.deleteUserFromLobby(userId, lobbyId)
    }

    @DeleteMapping("/v1/lobby")
    fun deleteLobby(
        @RequestParam lobbyId: String
    ) {
        lobbyService.deleteLobby(lobbyId)
    }
}