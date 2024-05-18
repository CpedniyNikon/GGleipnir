package ggleipnir.back.ggleipnirback.model.request

data class LobbyCreationRequest(
    val name: String,
    val closed: Boolean = false,
    val gameCartId: String
)
