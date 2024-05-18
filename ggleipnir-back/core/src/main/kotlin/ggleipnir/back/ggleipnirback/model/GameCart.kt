package ggleipnir.back.ggleipnirback.model

data class GameCart(
    val id: String,
    val name: String,
    val imageUrl: String,
    val peoplesInGame: Int,
    val category: Category
)