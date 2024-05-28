package ggleipnir.back.ggleipnirback.model

data class User(
    val id: String,
    val login: String,
    val password: String,
    val name: String,
    val meta: String,
    val image: String,
)
