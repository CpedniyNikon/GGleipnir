package ggleipnir.back.ggleipnirback.model

enum class Category(val id: Int) {
    MULTIPLAYER(1),
    SOLO(2),
    SHOOTER(3),
    RPG(4),
    RTS(5),
    MOBA(6);

    companion object {
        fun fromInt(value: Int): Category {
            return when (value) {
                1 -> MULTIPLAYER
                2 -> SOLO
                3 -> SHOOTER
                4 -> RPG
                5 -> RTS
                6 -> MOBA
                else -> throw RuntimeException("not matched category")
            }
        }
    }
}