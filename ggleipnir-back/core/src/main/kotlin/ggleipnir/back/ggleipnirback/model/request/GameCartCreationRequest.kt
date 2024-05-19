package ggleipnir.back.ggleipnirback.model.request

data class GameCartCreationRequest(
    val name: String,
    val imageUrl: String,
    val category: Int
)
