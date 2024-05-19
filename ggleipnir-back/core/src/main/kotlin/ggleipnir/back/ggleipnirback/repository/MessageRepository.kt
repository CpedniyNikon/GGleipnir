package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.repository.model.MessageDao

interface MessageRepository {
    fun sendMessageToLobby(userId: String, lobbyId: String, message: String?): Unit

    fun getMessageHistoryFromLobby(lobbyId: String): List<MessageDao>
}