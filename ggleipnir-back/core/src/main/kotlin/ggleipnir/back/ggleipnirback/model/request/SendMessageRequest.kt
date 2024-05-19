package ggleipnir.back.ggleipnirback.model.request

data class SendMessageRequest(
    val lobbyId: String,
    val userId: String,
    val message: String?,
)
