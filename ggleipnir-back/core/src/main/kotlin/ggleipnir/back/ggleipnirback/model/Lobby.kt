package ggleipnir.back.ggleipnirback.model

data class Lobby(val name: String, val playersCount: Int, val id: Long, val ping: Int, val closed: Boolean);
