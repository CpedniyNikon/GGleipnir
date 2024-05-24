package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.model.Lobby
import ggleipnir.back.ggleipnirback.model.request.LobbyCreationRequest
import ggleipnir.back.ggleipnirback.repository.model.LobbyDao

interface LobbyRepository {
    fun getLobbies(): List<Lobby>
    fun getLobbiesByGameId(gameId: String): List<Lobby>

    fun getLobbyByLobbyId(lobbyId: String): LobbyDao

    fun addLobby(lobby: LobbyCreationRequest): Unit

    fun addUserToLobby(userId: String, lobbyId: String): Unit

    fun deleteUserFromLobby(userId: String, lobbyId: String): Unit

    fun deleteLobby(lobbyId: String): Unit
}