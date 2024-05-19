package ggleipnir.back.ggleipnirback.controller

import ggleipnir.back.ggleipnirback.model.request.SendMessageRequest
import ggleipnir.back.ggleipnirback.repository.model.MessageDao
import ggleipnir.back.ggleipnirback.service.MessageService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class MessageController(
    val messageService: MessageService
) {
    @PostMapping("/v1/message")
    fun sendMessage(
        @RequestBody messageRequest: SendMessageRequest
    ) {
        messageService.sendMessageToLobby(messageRequest.userId, messageRequest.lobbyId, messageRequest.message)
    }

    @GetMapping("/v1/messages")
    fun sendMessage(
        @RequestParam lobbyId: String
    ): List<MessageDao> {
        return messageService.getMessageHistoryFromLobby(lobbyId)
    }

}