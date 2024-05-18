package ggleipnir.back.ggleipnirback.service

import ggleipnir.back.ggleipnirback.model.Lobby
import ggleipnir.back.ggleipnirback.model.request.LobbyCreationRequest
import ggleipnir.back.ggleipnirback.repository.LobbyRepository
import org.springframework.stereotype.Service

@Service
class LobbyService(
    val lobbyRepository: LobbyRepository
) {
    fun getLobbies(): List<Lobby> {
        return lobbyRepository.getLobbies();
    }

    fun getLobbiesByGame(gameId: String): List<Lobby> {
        return lobbyRepository.getLobbiesByGameId(gameId)
    }

    fun addLobby(lobby: LobbyCreationRequest) {
        lobbyRepository.addLobby(lobby)
    }

    fun addUserToLobby(userId: String, lobbyId: String) {
        lobbyRepository.addUserToLobby(userId, lobbyId)
    }

    fun deleteUserFromLobby(userId: String, lobbyId: String) {
        lobbyRepository.deleteUserFromLobby(userId, lobbyId)
    }

    fun deleteLobby(lobbyId: String): Unit {
        lobbyRepository.deleteLobby(lobbyId)
    }
}