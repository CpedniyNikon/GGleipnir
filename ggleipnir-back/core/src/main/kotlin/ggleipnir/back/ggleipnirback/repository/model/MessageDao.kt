package ggleipnir.back.ggleipnirback.repository.model

data class MessageDao(
    val id: String,
    val lobbyId: String,
    val userId: String,
    val message: String?,
    val createdAt: Long,
    val userLogin: String
)
