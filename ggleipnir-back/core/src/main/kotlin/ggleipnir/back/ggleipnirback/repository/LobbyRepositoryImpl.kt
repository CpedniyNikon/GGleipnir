package ggleipnir.back.ggleipnirback.repository

import ggleipnir.back.ggleipnirback.model.Lobby
import ggleipnir.back.ggleipnirback.model.request.LobbyCreationRequest
import ggleipnir.back.ggleipnirback.repository.model.LobbyDao
import ggleipnir.back.ggleipnirback.repository.model.LobbyUserMatch
import ggleipnir.back.ggleipnirback.util.IdGenerator
import ggleipnir.back.ggleipnirback.util.RandomGenerator
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository
import java.sql.ResultSet

@Repository
class LobbyRepositoryImpl(
    val jdbcTemplate: JdbcTemplate,
) : LobbyRepository {
    override fun getLobbies(): List<Lobby> {
        val queryLobbies = "select * from lobby;"
        val lobbies: List<LobbyDao> = jdbcTemplate.query(queryLobbies, ::mapLobbyRow)
        return addPlayersToLobby(lobbies)
    }

    override fun getLobbiesByGameId(gameId: String): List<Lobby> {
        val queryLobbies = "select * from lobby where game_cart_id=?;"
        val lobbies: List<LobbyDao> = jdbcTemplate.query(queryLobbies, ::mapLobbyRow, gameId)
        return addPlayersToLobby(lobbies)
    }

    override fun addLobby(lobby: LobbyCreationRequest) {
        val queryToAddLobby = "insert into lobby(id, name, closed, game_cart_id) values (?, ?, ?, ?);"
        jdbcTemplate.update(queryToAddLobby, IdGenerator.generateUuid(), lobby.name, lobby.closed, lobby.gameCartId)
    }

    override fun addUserToLobby(userId: String, lobbyId: String) {
        val queryToAddUserToLobby = "insert into lobby_user_match(id, lobby_id, user_id) values (?, ?, ?);"
        jdbcTemplate.update(queryToAddUserToLobby, IdGenerator.generateUuid(), lobbyId, userId)
    }

    override fun deleteUserFromLobby(userId: String, lobbyId: String) {
        val queryToDeleteUserFromLobby = "delete from lobby_user_match where user_id=? and lobby_id=?;"
        jdbcTemplate.update(queryToDeleteUserFromLobby, userId, lobbyId)
    }

    override fun deleteLobby(lobbyId: String) {
        val queryToDeleteUsersFromLobby = "delete from lobby_user_match where lobby_id=?;"
        jdbcTemplate.update(queryToDeleteUsersFromLobby, lobbyId)
        val queryToDeleteLobby = "delete from lobby where id=?;"
        jdbcTemplate.update(queryToDeleteLobby, lobbyId)
    }

    private fun addPlayersToLobby(lobbies: List<LobbyDao>): List<Lobby> {
        val queryUsersInLobby = "select * from lobby_user_match where lobby_id=?"
        val lobbiesResult = ArrayList<Lobby>()

        for (lobby in lobbies) {
            val users: List<LobbyUserMatch> = jdbcTemplate.query(queryUsersInLobby, ::mapLobbyUser, lobby.id)
            lobbiesResult.add(
                Lobby(
                    lobby.id,
                    lobby.name,
                    users.map { it.userId }.toList(),
                    lobby.ping,
                    lobby.closed,
                    lobby.gameCartId
                )
            )
        }
        return lobbiesResult
    }

    private fun mapLobbyRow(rs: ResultSet, rn: Int): LobbyDao {
        return LobbyDao(
            id = rs.getString("id"),
            name = rs.getString("name"),
            ping = RandomGenerator.generateRandomInt(100),
            closed = rs.getBoolean("closed"),
            gameCartId = rs.getString("game_cart_id")
        )
    }

    private fun mapLobbyUser(rs: ResultSet, rn: Int): LobbyUserMatch {
        return LobbyUserMatch(
            id = rs.getString("id"),
            lobbyId = rs.getString("lobby_id"),
            userId = rs.getString("user_id")
        )
    }
}