package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.model.Category
import ggleipnir.back.ggleipnirback.model.GameCart
import ggleipnir.back.ggleipnirback.model.request.GameCartCreationRequest
import ggleipnir.back.ggleipnirback.util.IdGenerator
import ggleipnir.back.ggleipnirback.util.RandomGenerator
import org.springframework.http.HttpStatus
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository
import org.springframework.web.server.ResponseStatusException
import java.sql.ResultSet

@Repository
class GameRepositoryImpl(val jdbcTemplate: JdbcTemplate) : GameRepository {
    override fun addGame(gameCartRequest: GameCartCreationRequest): GameCart {
        val queryToAddGame = "insert into game_cart(id, name, image_url, category) values (?, ?, ?);"
        val gameCart = GameCart(
            IdGenerator.generateUuid(),
            gameCartRequest.name,
            gameCartRequest.imageUrl,
            RandomGenerator.generateRandomInt(1000),
            Category.fromInt(gameCartRequest.category)
        )
        jdbcTemplate.update(
            queryToAddGame,
            gameCart.id,
            gameCart.name,
            gameCart.imageUrl,
            gameCart.category.id
        )
        return gameCart
    }

    override fun deleteGame(id: String) {
        val queryToDeleteGame = "delete from game_cart where id = ?";
        jdbcTemplate.update(queryToDeleteGame)
    }

    override fun getGame(id: String): GameCart {
        val queryToGame = "select * from game_cart where id=?"
        try {
            return jdbcTemplate.queryForObject(queryToGame, ::mapGameRow, id)!!
        } catch (e: Exception) {
            throw ResponseStatusException(HttpStatus.NOT_FOUND, "Game cart not found")
        }
    }

    override fun getGames(): List<GameCart> {
        val queryToGames = "select * from game_cart where id=?"
        return jdbcTemplate.query(queryToGames, ::mapGameRow)
    }

    private fun mapGameRow(rs: ResultSet, rn: Int): GameCart {
        return GameCart(
            id = rs.getString("id"),
            name = rs.getString("name"),
            imageUrl = rs.getString("image_url"),
            peoplesInGame = RandomGenerator.generateRandomInt(1000),
            category = Category.fromInt(rs.getInt("category"))
        )
    }
}