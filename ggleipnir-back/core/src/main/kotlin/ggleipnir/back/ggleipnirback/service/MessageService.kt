package ggleipnir.back.ggleipnirback.service

import ggleipnir.back.ggleipnirback.repository.MessageRepository
import ggleipnir.back.ggleipnirback.repository.model.MessageDao
import org.springframework.stereotype.Service

@Service
class MessageService(
    val messageRepository: MessageRepository,
    val authService: AuthService
) {
    fun sendMessageToLobby(userId: String, lobbyId: String, message: String?) {
        val login = authService.getUserById(userId).login
        messageRepository.sendMessageToLobby(userId, lobbyId, message, login)
    }

    fun getMessageHistoryFromLobby(lobbyId: String): List<MessageDao> {
        return messageRepository.getMessageHistoryFromLobby(lobbyId)
    }
}