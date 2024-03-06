package ggleipnir.back.ggleipnirback.model

data class GameCart(
    val name: String,
    val imageUrl: String,
    val peoplesInGame: Int,
    val category: List<Category>
)