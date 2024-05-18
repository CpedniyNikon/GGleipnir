package ggleipnir.back.ggleipnirback.model.request

import ggleipnir.back.ggleipnirback.model.Category

data class GameCartCreationRequest(
    val name: String,
    val imageUrl: String,
    val category: Category
)
