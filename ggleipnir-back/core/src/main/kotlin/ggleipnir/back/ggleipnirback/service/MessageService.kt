package ggleipnir.back.ggleipnirback.service

import ggleipnir.back.ggleipnirback.repository.MessageRepository
import ggleipnir.back.ggleipnirback.repository.model.MessageDao
import org.springframework.stereotype.Service

@Service
class MessageService(
    val messageRepository: MessageRepository
) {
    fun sendMessageToLobby(userId: String, lobbyId: String, message: String?) {
        messageRepository.sendMessageToLobby(userId, lobbyId, message)
    }

    fun getMessageHistoryFromLobby(lobbyId: String): List<MessageDao> {
        return messageRepository.getMessageHistoryFromLobby(lobbyId)
    }
}