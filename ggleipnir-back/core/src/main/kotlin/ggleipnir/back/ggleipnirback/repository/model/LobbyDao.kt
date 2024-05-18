package ggleipnir.back.ggleipnirback.repository.model

data class LobbyDao(
    val id: String,
    val name: String,
    val ping: Int,
    val closed: Boolean,
    val gameCartId: String,
)
