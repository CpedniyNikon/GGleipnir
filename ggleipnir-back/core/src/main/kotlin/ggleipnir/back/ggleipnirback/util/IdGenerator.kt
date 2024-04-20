package ggleipnir.back.ggleipnirback.util

import java.util.UUID

object IdGenerator {
    fun generateUuid(): String {
        return UUID.randomUUID().toString()
    }
}