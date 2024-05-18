package ggleipnir.back.ggleipnirback.model

data class Lobby(
    val id: String,
    val name: String,
    val playerIds: List<String>,
    val ping: Int,
    val closed: Boolean,
    val gameCartId: String,
);
