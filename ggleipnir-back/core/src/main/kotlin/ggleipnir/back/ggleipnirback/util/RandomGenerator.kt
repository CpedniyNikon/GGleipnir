package ggleipnir.back.ggleipnirback.util

import java.time.Instant
import kotlin.random.Random

object RandomGenerator {
    private val random = Random(Instant.now().toEpochMilli())

    fun generateRandomInt(module: Int): Int {
        return random.nextInt(module)
    }

    fun generateRandomLong(module: Long): Long {
        return random.nextLong(module)
    }
}