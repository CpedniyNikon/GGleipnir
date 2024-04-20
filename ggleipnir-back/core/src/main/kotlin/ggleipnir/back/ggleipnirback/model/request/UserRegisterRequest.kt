package ggleipnir.back.ggleipnirback.model.request

data class UserRegisterRequest (
    val login: String,
    val password: String,
    val name: String,
    val meta: String
)